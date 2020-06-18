import 'package:flutter/material.dart';
import 'package:the_good_bot/components/busy.widget.dart';
import 'package:the_good_bot/components/button.widget.dart';
import 'package:the_good_bot/controllers/login.controller.dart';
import 'package:the_good_bot/views/home.view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = new LoginController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  var busy = false;

  handleSignIn() {
    setState(() {
      busy = true;
    });
    controller.login().then((data) {
      onSuccess();
    }).catchError((err) {
      onError();
    }).whenComplete(() {
      onComplete();
    });
  }

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  onError() {
    var snackbar = new SnackBar(content: new Text("Falha no login"));
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  onComplete() {
    setState(() {
      busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: GBBusy(
          busy: busy,
          child: Card(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/chefbot.jpg'),
                      ),
                    ),
                  ),
                  Text(
                    "Olá, chef!",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Faça login para continuar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  GBButton(
                    text: "Login com Google",
                    image: "assets/images/google.png",
                    callback: () {
                      handleSignIn();
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
