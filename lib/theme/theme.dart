import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static const Color darkSurface = Color(0xff000000);
  static const Color darkSurfaceContainer = Color(0xff111111);
  static const Color darkOnSurfaceContainer = Color(0xff909090);

  static const Color darkOnSurface = Color(0xffffffff);
  static const Color darkOnSurfaceVariant = Color(0xff909090);

  static const Color darkPrimary = Color(0xffff0000);
  static const Color darkOnPrimary = Color(0xffffffff);
  static const Color darkOnPrimaryContainer = Color(0xffaf53fa);

  static const Color darkSecondary = Color(0xff8753b1);
  static const Color darkOnSecondary = Color(0xffffffff);

  static const Color darkTertiary = Color(0xff06402b);

  static const Color darkError = Color(0xfffe028d);
  static const Color darkOnError = Color(0xffffffff);

  static const Color darkOutline = Color(0xff636363);

  static ColorScheme darkColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,

      surface: darkSurface,
      surfaceContainer: darkSurfaceContainer,

      onSurface: darkOnSurface,
      onSurfaceVariant: darkOnSurfaceVariant,
      inverseSurface: Color(0xffebdeef),

      primary: darkPrimary,
      onPrimary: darkOnPrimary,
      secondary: darkSecondary,
      onSecondary: darkOnSecondary,

      tertiary: darkTertiary,
      error: darkError,
      onError: darkOnError,
      outline: darkOutline,
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
    return ProgressIndicatorThemeData(
      linearTrackColor: darkOnSurfaceContainer,
      color: darkPrimary,
      circularTrackColor: darkOnSurfaceContainer,
    );
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
