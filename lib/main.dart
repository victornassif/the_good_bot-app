import 'package:flutter/material.dart';
import 'package:the_good_bot/themes/style.dart';
import 'package:the_good_bot/views/home.view.dart';
import 'package:the_good_bot/views/login.view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: LoginView(),
    );
  }
}
