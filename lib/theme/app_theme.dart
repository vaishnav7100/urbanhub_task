import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const String fontFamily = 'TT Fors Trial';

  static const Color finlotPrimary = Color(0xFFABCC00);
  static const Color finlotMint = Color(0xFFD5E9DA);
  static const Color finlotPastelLime = Color(0xFFD9ECC2);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      textTheme: ThemeData.light().textTheme.apply(fontFamily: fontFamily),
      colorScheme: ColorScheme.fromSeed(
        seedColor: finlotPrimary,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: fontFamily),
      colorScheme: ColorScheme.fromSeed(
        seedColor: finlotPrimary,
        brightness: Brightness.dark,
      ),
    );
  }
}
