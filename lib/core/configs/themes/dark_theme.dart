import 'package:flutter/material.dart';

ThemeData darkTheme  = ThemeData(
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
);