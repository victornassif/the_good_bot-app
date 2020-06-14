import 'package:flutter/material.dart';

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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),
              ),
            ),
          ),
          ListTile(
            trailing: Icon(Icons.chat),
            title: Text('chat', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
