import 'package:flutter/material.dart';
import 'package:the_good_bot/user.dart';
import 'package:the_good_bot/utils/tipoMensagem.enum.dart';

class ChatMessage extends StatefulWidget {
  ChatMessage({this.text, this.name, this.type, this.date});

  final DateTime date;
  final String text;
  final String name;
  final TipoMensagem type;

  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  List<Widget> getWidget(ChatMessage msg) {
    switch (msg.type) {
      case TipoMensagem.user:
        return myMessage(msg);
        break;
      case TipoMensagem.other:
        return otherMessage(msg);
        break;
      case TipoMensagem.receita:
        return otherMessage(msg);
        break;
    }
  }

  List<Widget> otherMessage(ChatMessage message) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/chefbot.jpg'),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(message.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(message.text),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(ChatMessage message) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(message.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(message.text),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(user.picture),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getWidget(this.widget)),
    );
  }
}
