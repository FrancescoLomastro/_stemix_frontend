import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  /* static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff7700c8),
      surfaceTint: Color(0xff8b00e7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9810fa),
      onPrimaryContainer: Color(0xfff5e2ff),
      secondary: Color(0xff7b43ae),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc98fff),
      onSecondaryContainer: Color(0xff571c8a),
      tertiary: Color(0xff9a0071),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc50092),
      onTertiaryContainer: Color(0xffffe1ee),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff7fe),
      onSurface: Color(0xff1f1925),
      onSurfaceVariant: Color(0xff4d4355),
      outline: Color(0xff7f7387),
      outlineVariant: Color(0xffd0c1d8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352e3a),
      inversePrimary: Color(0xffdeb7ff),
      primaryFixed: Color(0xfff1dbff),
      onPrimaryFixed: Color(0xff2d0050),
      primaryFixedDim: Color(0xffdeb7ff),
      onPrimaryFixedVariant: Color(0xff6a00b2),
      secondaryFixed: Color(0xfff1dbff),
      onSecondaryFixed: Color(0xff2d0050),
      secondaryFixedDim: Color(0xffdeb7ff),
      onSecondaryFixedVariant: Color(0xff612894),
      tertiaryFixed: Color(0xffffd8ea),
      onTertiaryFixed: Color(0xff3c002a),
      tertiaryFixedDim: Color(0xffffaed9),
      onTertiaryFixedVariant: Color(0xff890064),
      surfaceDim: Color(0xffe2d6e7),
      surfaceBright: Color(0xfffff7fe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf0ff),
      surfaceContainer: Color(0xfff6eafb),
      surfaceContainerHigh: Color(0xfff1e4f5),
      surfaceContainerHighest: Color(0xffebdeef),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }
 */
  /* static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff52008c),
      surfaceTint: Color(0xff8b00e7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9810fa),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4f1182),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8a52be),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff6b004e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc50092),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fe),
      onSurface: Color(0xff150f1a),
      onSurfaceVariant: Color(0xff3c3244),
      outline: Color(0xff594e62),
      outlineVariant: Color(0xff75697d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352e3a),
      inversePrimary: Color(0xffdeb7ff),
      primaryFixed: Color(0xff9d1dff),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff7d00d1),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8a52be),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff7038a3),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffcb0e97),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xffa20077),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcec3d3),
      surfaceBright: Color(0xfffff7fe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf0ff),
      surfaceContainer: Color(0xfff1e4f5),
      surfaceContainerHigh: Color(0xffe5d9e9),
      surfaceContainerHighest: Color(0xffdacede),
    );
  } */

  /* ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  } */

  /* static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff440075),
      surfaceTint: Color(0xff8b00e7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6d00b7),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff440075),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff642b97),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff590040),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8d0068),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fe),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff32283a),
      outlineVariant: Color(0xff504558),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352e3a),
      inversePrimary: Color(0xffdeb7ff),
      primaryFixed: Color(0xff6d00b7),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4d0084),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff642b97),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4c0a7e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8d0068),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff650049),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0b5c5),
      surfaceBright: Color(0xfffff7fe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9edfd),
      surfaceContainer: Color(0xffebdeef),
      surfaceContainerHigh: Color(0xffdcd0e1),
      surfaceContainerHighest: Color(0xffcec3d3),
    );
  } */

  /* ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  } */
  static const Color darkSurface = Color(0xff000000);
  static const Color darkSurfaceContainer = Color(0xff111111);
  static const Color darkOnSurfaceContainer = Color(0xff909090);

  static const Color darkOnSurface = Color(0xffffffff);
  static const Color darkOnSurfaceVariant = Color(0xff909090);

  static const Color darkPrimary = Color(0xffff0000);
  static const Color darkOnPrimary = Color(0xffffffff);
  static const Color darkOnPrimaryContainer = Color(0xffaf53fa);

  static const Color darkSecondary = Color(0xff8753b1);

  static const Color darkTertiary = Color(0xff06402b);

  static const Color darkError = Color(0xfffe028d);
  static const Color darkOnError = Color(0xffffffff);

  static const Color darkOutline = Color(0xffffb4ab);

  static ColorScheme darkColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,

      surface: darkSurface,
      surfaceContainer: darkSurfaceContainer,

      onSurface: darkOnSurface,
      onSurfaceVariant: darkOnSurfaceVariant,
      /* surfaceTint: Color(0xffdeb7ff), */
      /* surfaceDim: Color(0xff17111c),
      surfaceBright: Color(0xff3e3643), */
      /* surfaceContainerLowest: Color(0xff120c17),
      surfaceContainerLow: Color(0xff1f1925), */
      /* surfaceContainerHigh: Color(0xff2e2733),
      surfaceContainerHighest: Color(0xff39323f), */
      inverseSurface: Color(0xffebdeef),

      primary: darkPrimary,
      onPrimary: darkOnPrimary,
      primaryContainer: Color(0xff9810fa),
      onPrimaryContainer: darkOnPrimaryContainer,
      primaryFixed: Color(0xfff1dbff),
      onPrimaryFixed: Color(0xff2d0050),
      primaryFixedDim: Color(0xffdeb7ff),
      onPrimaryFixedVariant: Color(0xff6a00b2),
      inversePrimary: Color(0xff8b00e7),

      secondary: darkSecondary,
      onSecondary: Color(0xff49057c),
      secondaryContainer: Color(0xff612894),
      onSecondaryContainer: Color(0xffd2a0ff),
      secondaryFixed: Color(0xfff1dbff),
      onSecondaryFixed: Color(0xff2d0050),
      secondaryFixedDim: Color(0xffdeb7ff),
      onSecondaryFixedVariant: Color(0xff612894),

      tertiary: darkTertiary,
      onTertiary: Color(0xff610046),
      tertiaryContainer: Color(0xffc50092),
      onTertiaryContainer: Color(0xffffe1ee),
      tertiaryFixed: Color(0xffffd8ea),
      onTertiaryFixed: Color(0xff3c002a),
      tertiaryFixedDim: Color(0xffffaed9),
      onTertiaryFixedVariant: Color(0xff890064),

      error: darkError,

      onError: darkOnError,

      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),

      outline: darkOutline,
      outlineVariant: Color(0xff4d4355),

      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
    );
  }

  static CheckboxThemeData darkCheckboxTheme() {
    return CheckboxThemeData(
      checkColor: WidgetStateProperty.all(darkOnSurface),
    );
  }

  static DialogThemeData darkDialogTheme() {
    return DialogThemeData(
      backgroundColor: darkSurfaceContainer,
      titleTextStyle: TextStyle(
        color: darkOnSurface,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static ProgressIndicatorThemeData darkProgressIndicatorTheme() {
    return ProgressIndicatorThemeData(color: darkSecondary);
  }

  static SliderThemeData darkSliderTheme() {
    const thumbShape = RoundSliderThumbShape(
      enabledThumbRadius: 6,
      disabledThumbRadius: 6,
    );

    return SliderThemeData(
      trackHeight: 2,
      thumbShape: thumbShape,
      overlayShape: SliderComponentShape.noOverlay,
      thumbColor: darkPrimary,
      activeTrackColor: darkPrimary,
      inactiveTrackColor: darkOnSurfaceVariant,
    );
  }

  static DividerThemeData darkDividerTheme() {
    return DividerThemeData(color: darkOnSurface, thickness: 1, space: 0.5);
  }

  static InputDecorationThemeData darkInputDecorationTheme() {
    return InputDecorationThemeData(
      filled: true,
      fillColor: darkSurfaceContainer,
      labelStyle: TextStyle(color: darkOnSurfaceVariant),
      floatingLabelStyle: TextStyle(color: darkOnPrimary),

      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkOnSurface, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  ThemeData dark() {
    return theme(
      darkColorScheme(),
      darkCheckboxTheme(),
      darkDialogTheme(),
      darkProgressIndicatorTheme(),
      darkSliderTheme(),
      darkDividerTheme(),
      darkInputDecorationTheme(),
    );
  }

  /* static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffedd3ff),
      surfaceTint: Color(0xffdeb7ff),
      onPrimary: Color(0xff3b0067),
      primaryContainer: Color(0xffb86cff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffedd3ff),
      onSecondary: Color(0xff3b0067),
      secondaryContainer: Color(0xffb077e5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffcfe6),
      onTertiary: Color(0xff4e0038),
      tertiaryContainer: Color(0xfffa44bd),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff17111c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe7d7ef),
      outline: Color(0xffbbadc3),
      outlineVariant: Color(0xff998ca1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebdeef),
      inversePrimary: Color(0xff6b00b4),
      primaryFixed: Color(0xfff1dbff),
      onPrimaryFixed: Color(0xff1e0038),
      primaryFixedDim: Color(0xffdeb7ff),
      onPrimaryFixedVariant: Color(0xff52008c),
      secondaryFixed: Color(0xfff1dbff),
      onSecondaryFixed: Color(0xff1e0038),
      secondaryFixedDim: Color(0xffdeb7ff),
      onSecondaryFixedVariant: Color(0xff4f1182),
      tertiaryFixed: Color(0xffffd8ea),
      onTertiaryFixed: Color(0xff29001c),
      tertiaryFixedDim: Color(0xffffaed9),
      onTertiaryFixedVariant: Color(0xff6b004e),
      surfaceDim: Color(0xff17111c),
      surfaceBright: Color(0xff49424f),
      surfaceContainerLowest: Color(0xff0a050f),
      surfaceContainerLow: Color(0xff221b27),
      surfaceContainer: Color(0xff2c2531),
      surfaceContainerHigh: Color(0xff37303c),
      surfaceContainerHighest: Color(0xff423b48),
    );
  } */

  /* ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  } */

  /* static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9ebff),
      surfaceTint: Color(0xffdeb7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffdbb2ff),
      onPrimaryContainer: Color(0xff16002b),
      secondary: Color(0xfff9ebff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffdbb2ff),
      onSecondaryContainer: Color(0xff16002b),
      tertiary: Color(0xffffebf2),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffa8d7),
      onTertiaryContainer: Color(0xff1f0014),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff17111c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff9ebff),
      outlineVariant: Color(0xffccbdd4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebdeef),
      inversePrimary: Color(0xff6b00b4),
      primaryFixed: Color(0xfff1dbff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffdeb7ff),
      onPrimaryFixedVariant: Color(0xff1e0038),
      secondaryFixed: Color(0xfff1dbff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffdeb7ff),
      onSecondaryFixedVariant: Color(0xff1e0038),
      tertiaryFixed: Color(0xffffd8ea),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffaed9),
      onTertiaryFixedVariant: Color(0xff29001c),
      surfaceDim: Color(0xff17111c),
      surfaceBright: Color(0xff554d5b),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff241d29),
      surfaceContainer: Color(0xff352e3a),
      surfaceContainerHigh: Color(0xff403945),
      surfaceContainerHighest: Color(0xff4c4451),
    );
  } */

  /* ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  } */

  ThemeData theme(
    ColorScheme colorScheme,
    CheckboxThemeData checkboxTheme,
    DialogThemeData dialogTheme,
    ProgressIndicatorThemeData progressIndicatorTheme,
    SliderThemeData sliderTheme,
    DividerThemeData? dividerTheme,
    InputDecorationThemeData inputDecorationTheme,
  ) => ThemeData(
    useMaterial3: true,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colorScheme.onSurface,
      selectionHandleColor: colorScheme.primary,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    ),
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    checkboxTheme: checkboxTheme,
    dialogTheme: dialogTheme,
    progressIndicatorTheme: progressIndicatorTheme,
    sliderTheme: sliderTheme,
    dividerTheme: dividerTheme,
    inputDecorationTheme: inputDecorationTheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
