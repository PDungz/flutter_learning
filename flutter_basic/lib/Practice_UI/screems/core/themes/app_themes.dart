import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get defaultTheme {
    return ThemeData(
      primaryColor: const Color(0xFF253554),
      scaffoldBackgroundColor: const Color(0xff1A2232),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF1F293D),
      ),

      // Text Themme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32, color: Colors.white),
        headlineMedium: TextStyle(fontSize: 28, color: Colors.white),
        headlineSmall: TextStyle(fontSize: 24, color: Colors.white),

        //
        titleLarge: TextStyle(fontSize: 22, color: Colors.white),
        titleMedium: TextStyle(fontSize: 16, color: Colors.white),
        titleSmall: TextStyle(fontSize: 14, color: Colors.white),

        //
        labelLarge: TextStyle(fontSize: 14, color: Colors.white),
        labelMedium: TextStyle(fontSize: 12, color: Colors.white),
        labelSmall: TextStyle(fontSize: 11, color: Colors.white),

        //
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
        bodySmall: TextStyle(fontSize: 12, color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFFFF8036),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF8036),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(color: Colors.white30),
        focusColor: Color(0xFFFF8036),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color:
                  Color(0xFFFF8036) // Màu khi trường đầu vào không được focus
              ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF8036), // Màu khi trường đầu vào được focus
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red, // Màu khi có lỗi
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red, // Màu khi có lỗi và trường đầu vào được focus
          ),
        ),
      ),
    );
  }
}
