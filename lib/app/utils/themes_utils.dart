import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class ThemeUtils {
  ThemeData buildThemeData(BuildContext context) {
    return ThemeData(
        inputDecorationTheme: inputDecorationThemeSettings(),
        textTheme: textThemeSettings(context),
        backgroundColor: Colors.white,
        primarySwatch: primarySwatchColorGenerator(AppColor.colorPrimary),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: buttonThemeSettings());
  }

  InputDecorationTheme inputDecorationThemeSettings() {
    return InputDecorationTheme(
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        counterStyle: const TextStyle(color: AppColor.hintTextColor),
        errorBorder: outlineInputBorder(color: AppColor.errorColor),
        errorStyle: const TextStyle(color: AppColor.errorColor));
  }

  OutlineInputBorder outlineInputBorder({Color? color}) =>
      OutlineInputBorder(borderSide: BorderSide(color: color ?? Colors.white));

  TextTheme textThemeSettings(BuildContext context) {
    return GoogleFonts.robotoTextTheme(
      Theme.of(context).textTheme,
    ).apply(bodyColor: AppColor.textColor);
  }

  MaterialColor primarySwatchColorGenerator(Color color) {
    return MaterialColor(color.value, <int, Color>{
      50: color,
      100: color,
      200: color,
      300: color,
      400: color,
      500: color,
      600: color,
      700: color,
      800: color,
      900: color,
    });
  }

  ElevatedButtonThemeData buttonThemeSettings({
    Color? backgroundColor,
    EdgeInsets? padding,
  }) {
    return ElevatedButtonThemeData(
        style: solidButtonStyle(padding:padding,backgroundColor:
        backgroundColor));
  }

  ButtonStyle solidButtonStyle({EdgeInsets? padding, Color? backgroundColor}) {
    return ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding ??
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0)),
    backgroundColor: MaterialStateProperty.all<Color>(
        backgroundColor ?? AppColor.colorPrimary),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: backgroundColor ?? AppColor.colorPrimary)),
    ),
  );
  }

  ButtonStyle outlineButtonStyle({
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0.0),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0)),
      backgroundColor:
          MaterialStateProperty.all<Color>(backgroundColor ?? Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side:
                BorderSide(color: borderColor ?? AppColor.colorPrimaryButton)),
      ),
    );
  }
}
