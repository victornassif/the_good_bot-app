import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color(0xFF30363D);
const accentColor = const Color(0xFFF27A54);


ThemeData theme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: accentColor,
    fontFamily: 'Ubuntu',
  );
}
