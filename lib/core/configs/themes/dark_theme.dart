import 'package:flutter/material.dart';

const PurpleMoonColor = Color(0xFF5C33CF);
const BlackMoonColor = Color(0xFF1F1F1F);

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  scaffoldBackgroundColor: BlackMoonColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: PurpleMoonColor, // Background color of the FAB
    foregroundColor: Colors.white, // Color of the plus icon or label
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: BlackMoonColor,
    elevation: 0,
    titleTextStyle: TextStyle(
        letterSpacing: 1.2,
        color: Colors.white,
        fontFamily: "Poppins",
        fontSize: 22,
        fontWeight: FontWeight.bold
        //  fontFamily: 'Poppins',
        ),
  ),
  cardTheme: CardTheme(
    color: Colors.grey[900], // Dark background for the card
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Slightly rounded corners
      side: BorderSide(color: Colors.grey[800]!, width: 1), // Subtle border
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
);
