import 'package:flutter/material.dart';
import 'package:the_good_bot/components/appbar.widget.dart';
import 'package:the_good_bot/models/receitas.model.dart';

class ReceitaInfo extends StatefulWidget {
  final Receita receita;
  ReceitaInfo({this.receita});

  @override
  _ReceitaInfoState createState() => _ReceitaInfoState();
}

class _ReceitaInfoState extends State<ReceitaInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(this.widget.receita.nome),
      body: Column(
        children: <Widget>[
          Expanded(
            child: buildListView(this.widget.receita.listInfos),
          )
        ],
      ),
    );
  }

  ListView buildListView(List<Info> listInfo) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: listInfo == null ? 0 : listInfo.length,
      itemBuilder: (BuildContext ctx, int i) {
        return cardInfo(listInfo[i]);
      },
    );
  }

  Card cardInfo(Info info) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
        ),
        child: Column(
          children: <Widget>[
            //titulo
            Text(
              info.nome,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            //content
            Container(
              margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 30),
              child: buildListViewInfo(info.conteudo),
            )
          ],
        ),
      ),
    );
  }

  ListView buildListViewInfo(List<String> listConteudo) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: listConteudo == null ? 0 : listConteudo.length,
      itemBuilder: (BuildContext ctx, int i) {
        return conteudo(listConteudo[i]);
      },
    );
  }

  Text conteudo(String conteudo) {
    return Text(conteudo);
  }
}
