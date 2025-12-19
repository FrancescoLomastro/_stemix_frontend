import 'package:flutter/material.dart';

class AppTheme {
  // /* TEMI CUSTOMIZZATI - COMMENTATI
  // // Light Theme Colors
  // static const Color lightPrimary = Color(0xFF6750A4);
  // static const Color lightSecondary = Color(0xFF625B71);
  // static const Color lightTertiary = Color(0xFF7D5260);
  // static const Color lightError = Color(0xFFB3261E);
  // static const Color lightBackground = Color(0xFFFFFBFE);
  // static const Color lightSurface = Color(0xFFFFFBFE);
  //
  // static ThemeData get lightTheme {
  //   return ThemeData(
  //     useMaterial3: true,
  //     brightness: Brightness.light,
  //     colorScheme: ColorScheme.light(
  //       primary: lightPrimary,
  //       secondary: lightSecondary,
  //       tertiary: lightTertiary,
  //       error: lightError,
  //       surface: lightSurface,
  //       onPrimary: Colors.white,
  //       onSecondary: Colors.white,
  //       onTertiary: Colors.white,
  //       onError: Colors.white,
  //       onSurface: Color(0xFF1C1B1F),
  //     ),
  //     scaffoldBackgroundColor: lightBackground,
  //     appBarTheme: AppBarTheme(
  //       elevation: 0,
  //       centerTitle: true,
  //       backgroundColor: lightBackground,
  //       foregroundColor: Color(0xFF1C1B1F),
  //     ),
  //     cardTheme: CardThemeData(
  //       elevation: 1,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         elevation: 1,
  //         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //       ),
  //     ),
  //   );
  // }
  //
  // // Dark Theme Colors
  // static const Color darkPrimary = Color.fromARGB(255, 175, 83, 250);
  // static const Color darkSecondary = Color(0xFFCCC2DC);
  // static const Color darkTertiary = Color(0xFFEFB8C8);
  // static const Color darkError = Color(0xFFF2B8B5);
  // static const Color darkBackground = Color(0xFF1C1B1F);
  // static const Color darkSurface = Color(0xFF90A1B9);
  //
  // static const Color darkOutline = Color(0xFF314158);
  //
  // static ThemeData get darkTheme {
  //   return ThemeData(
  //     useMaterial3: true,
  //     brightness: Brightness.dark,
  //     colorScheme: ColorScheme.dark(
  //       primary: darkPrimary,
  //       secondary: darkSecondary,
  //       tertiary: darkTertiary,
  //       error: darkError,
  //       surface: darkSurface,
  //       onPrimary: Color(0xFF381E72),
  //       onSecondary: Color(0xFF332D41),
  //       onTertiary: Color(0xFF492532),
  //       onError: Color(0xFF601410),
  //       onSurface: darkSurface,
  //       outline: darkOutline,
  //     ),
  //     scaffoldBackgroundColor: darkBackground,
  //     appBarTheme: AppBarTheme(
  //       elevation: 0,
  //       centerTitle: true,
  //       backgroundColor: darkBackground,
  //       foregroundColor: Color(0xFFE6E1E5),
  //     ),
  //     cardTheme: CardThemeData(
  //       elevation: 1,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         elevation: 1,
  //         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //       ),
  //     ),
  //   );
  // }
  // */

  // Temi di default Material 3
  static ThemeData get lightTheme {
    return ThemeData(useMaterial3: true, brightness: Brightness.light);
  }

  static ThemeData get darkTheme {
    return ThemeData(useMaterial3: true, brightness: Brightness.dark);
  }

  static Color defaultImagePlaceholderBackground = const Color.fromARGB(
    255,
    73,
    70,
    70,
  );
  static Color defaultImagePlaceholderForeground = const Color.fromARGB(
    255,
    255,
    255,
    255,
  );

  static Color defaultWhite = const Color.fromARGB(255, 255, 255, 255);

  static Color defaultBlack = const Color.fromARGB(255, 0, 0, 0);
}
