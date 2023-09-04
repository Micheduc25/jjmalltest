import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme() {
  const Color yellowMain = Color(0xFFFEC54B);
  const Color orange = Color(0xFFE67F1E);
  const Color background = Color(0xFFF5F5F5);
  const Color grey = Color(0xFFB1B1B1);

  return ThemeData(
      primaryColor: yellowMain,
      useMaterial3: true,
      secondaryHeaderColor: orange,
      scaffoldBackgroundColor: background,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.bold),
        titleMedium: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.bold),
        titleSmall: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.poppins(color: Colors.black),
      ),
      colorScheme: const ColorScheme.light(
          primary: yellowMain,
          secondary: orange,
          surface: Colors.white,
          onSurface: Colors.black,
          tertiary: grey),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(double.infinity, 60)),
              maximumSize: MaterialStateProperty.all(Size(double.infinity, 60)),
              backgroundColor: MaterialStateProperty.all(yellowMain),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.bold)))),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFCACACA)),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFCACACA)),
            borderRadius: BorderRadius.all(Radius.circular(32))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: orange),
            borderRadius: BorderRadius.all(Radius.circular(32))),
      ),
      bottomSheetTheme:
          BottomSheetThemeData(surfaceTintColor: Colors.transparent));
}
