import 'package:flutter/material.dart';
import 'package:the_good_bot/controllers/login.controller.dart';
import 'package:the_good_bot/views/chat.view.dart';
import 'package:the_good_bot/views/login.view.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * 0.3,
            child: DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          ),
          ListTile(
            trailing: Icon(Icons.chat),
            title: Text(
              'chat',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatView(),
                ),
              );
            },
          ),
          ListTile(
            trailing: Icon(Icons.exit_to_app),
            title: Text(
              'logout',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            onTap: () {
              LoginController().logout().then((data) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                );
              }); // TRATAR POSSÍVEL ERRO
            },
          ),
        ],
      ),
    );
  }
}
