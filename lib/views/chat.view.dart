import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter/material.dart';
import 'package:the_good_bot/components/chat.widget.dart';
import 'package:the_good_bot/repository/receitas.repository.dart';
import 'package:the_good_bot/user.dart';
import 'package:the_good_bot/utils/tipoMensagem.enum.dart';

class ChatView extends StatefulWidget {
  ChatView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatView createState() => _ChatView();
}

class _ChatView extends State<ChatView> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      name: user.name,
      type: TipoMensagem.user,
    );

    enviarMensagem(message);
    response(text);
  }

  void response(query) async {
    _textController.clear();
    AuthGoogle authGoogle = await AuthGoogle(
            fileJson: "assets/credentials/thegoodbot-dwdqmt-3df7a74d8bce.json")
        .build();

    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);

    ChatMessage message = ChatMessage(
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()[0]).title,
      name: "ChefBot",
      type: TipoMensagem.other,
    );
    enviarMensagem(message);

    if (message.type == TipoMensagem.other &&
        message.text != "Está afim de comer o que?" &&
        (message.text.substring(0, 32) == 'Irei pesquisar o que temos sobre' ||
            message.text.substring(0, 13) == "Ótima escolha")) {
      var str = await ReceitasRepository()
          .getReceitaFromTermo(message.text.split(' ').last);

      if (str.length > 0) {
        ChatMessage novaMensagem = ChatMessage(
          name: "ChefBot",
          type: TipoMensagem.receita,
          text: "Encontrei ${str.length} receitas para você.",
        );
        enviarMensagem(novaMensagem);
      }

      str.forEach((element) {
        StringBuffer sb = StringBuffer();
        sb.writeln(element.nome);
        sb.writeln('');

        element.listInfos.forEach((info) {
          sb.writeln(info.nome);
          info.conteudo.forEach((array) => sb.writeln(array));
          sb.writeln('');
        });

        ChatMessage novaMensagem = ChatMessage(
          name: "ChefBot",
          type: TipoMensagem.receita,
          text: sb.toString(),
        );
        enviarMensagem(novaMensagem);
      });
    }
  }

  void enviarMensagem(ChatMessage message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ChefBot"),
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}