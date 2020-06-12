import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color(0xFF30363D);
const accentColor = const Color(0xFFF27A54);


ThemeData theme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: accentColor,
    textTheme: TextTheme(
      body1: TextStyle(
        fontFamily: "Ubuntu",
      ),
      body2: TextStyle(
        fontFamily: "Ubuntu",
      ),
      button: TextStyle(
        fontFamily: "Ubuntu",
      ),
      caption: TextStyle(
        fontFamily: "Ubuntu",
      ),
      display1: TextStyle(
        fontFamily: "Ubuntu",
      ),
      display2: TextStyle(
        fontFamily: "Ubuntu",
      ),
      display3: TextStyle(
        fontFamily: "Ubuntu",
      ),
      display4: TextStyle(
        fontFamily: "Ubuntu",
      ),
      headline: TextStyle(
        fontFamily: "Ubuntu",
      ),
      overline: TextStyle(
        fontFamily: "Ubuntu",
      ),
      subhead: TextStyle(
        fontFamily: "Ubuntu",
      ),
      subtitle: TextStyle(
        fontFamily: "Ubuntu",
      ),
      title: TextStyle(
        fontFamily: "Ubuntu",
      ),
    ),
  );
}
