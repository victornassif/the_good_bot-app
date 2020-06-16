import 'package:flutter/material.dart';

AppBar appBar(name) {
  return AppBar(
    bottom: PreferredSize(
      child: Container(
        color: Colors.white,
        height: 1,
      ),
      preferredSize: Size.fromHeight(1.0),
    ),
    backgroundColor: Color(0xFF3C444C),
    centerTitle: true,
    title: Text(
      name,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
    ),
  );
}
