import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      color: Colors.white,
    ),
  );

  static ListTileThemeData lightListTileTheme = ListTileThemeData(
      iconColor: Colors.black38,
      selectedColor: Color.fromARGB(246, 234, 232, 232));

  static ListTileThemeData darkListTileTheme = ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white,
      selectedColor: Colors.black54);

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      listTileTheme: lightListTileTheme,
      textTheme: lightTextTheme,
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(Colors.white),
          trackColor: MaterialStateProperty.all<Color>(Colors.black12),
        )
    );
  }

  static ThemeData dark() {
    return ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[900],
        ),
        listTileTheme: darkListTileTheme,
        textTheme: darkTextTheme,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(Colors.white),
          trackColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 106, 131, 176)),
        ));
  }
}
