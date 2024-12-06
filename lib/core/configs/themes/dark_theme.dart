import 'package:flutter/material.dart';

ThemeData darkTheme  = ThemeData(
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.grey[900],

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue[700],
      // White text on the button
      padding: const EdgeInsets.symmetric(
          horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue[700],
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    elevation: 0,
    titleTextStyle: const TextStyle(
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
  iconTheme: const IconThemeData(color: Colors.white),
);