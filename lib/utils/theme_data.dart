import 'package:flutter/material.dart';

abstract class CustomTheme {
  CustomTheme._();

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      primaryColor: const Color(0xFF870000),
      primaryColorDark: const Color(0xFF222437),
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerColor: const Color.fromARGB(255, 226, 226, 226),
      backgroundColor: Colors.grey[200]);

  static get darkTheme => ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      primaryColor: const Color(0xFF870000),
      primaryColorDark: const Color(0xFF222437),
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerColor: Colors.grey,
      backgroundColor: Colors.grey[900]);
}
