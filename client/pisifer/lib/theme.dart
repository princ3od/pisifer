import 'package:flutter/material.dart';

class AppColor {
  //
}

class AppTheme {
  static final theme = ThemeData.light().copyWith(
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
    ),
  );
}
