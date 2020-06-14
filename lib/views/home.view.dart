import 'package:flutter/material.dart';
import 'package:the_good_bot/models/receitas.model.dart';
import 'package:the_good_bot/repository/receitas.repository.dart';
import 'package:the_good_bot/views/navbar.view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            height: 1,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
        backgroundColor: Color(0xFF3C444C),
        // leading: FlatButton(
        //   child: Icon(
        //     Icons.menu,
        //     color: Theme.of(context).accentColor,
        //   ),
        //   onPressed: (){
        //     return NavBar();
        //   },
        // ),
        centerTitle: true,
        title: Text(
          "Receitas do chef",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        ),
      ),
      body: FutureBuilder(
        future: ReceitasRepository().getReceitasAleatorias(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).accentColor,
              ),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<Receita> receitas) {
    return ListView.builder(
      itemCount: receitas == null ? 0 : receitas.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardReceita(receitas[index]);
      },
    );
  }

  Card cardReceita(Receita receita) {
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
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 8.0,
          ),
          title: Text(
            receita.nome,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Clique para ver mais',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 11,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => DetailsView(
            //         receita: receita,
            //       ),
            //     ));
          },
        ),
      ),
    );
  }
}
