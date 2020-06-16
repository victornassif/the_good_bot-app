import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color(0xFF01426B);
const accentColor = const Color(0xFFE88802);


ThemeData theme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: accentColor,
    fontFamily: 'Ubuntu',
  );
}
