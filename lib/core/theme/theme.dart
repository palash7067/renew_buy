import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'colors.dart';

/// Defines app theme including text themes.
class ApplicationTheme {

  static String font = "Geologica";

  static ThemeData getAppThemeData() => ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    // colorScheme:_customColorScheme,
    iconTheme: const IconThemeData(color: textDarkColor),
    appBarTheme: const AppBarTheme(backgroundColor: whiteColor),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    ),
    textTheme: TextTheme(

      displayLarge: TextStyle(
        fontSize:  18.sp,
        fontWeight: FontWeight.w500,
        color: textDarkColor,
        fontFamily: font,
      ),
      displayMedium: TextStyle(
        fontSize:  16.5.sp,
        fontWeight: FontWeight.w500,
        color: textDarkColor,
        fontFamily: font,
      ),
      displaySmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: textDarkColor,
        fontFamily: font,
      ),
      headlineLarge: TextStyle(
        fontSize:  14.5.sp,
        fontWeight: FontWeight.w800,
        color: textDarkColor,
        fontFamily: font,
      ),
      headlineMedium: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: textDarkColor,
        fontFamily: font,
      ),
      headlineSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: textLightColor,
        fontFamily: font,
      ),
      titleLarge: TextStyle(
        fontSize: 9.sp,
        fontWeight: FontWeight.w400,
        color: textDarkColor,
        fontFamily: font,
      ),
      titleMedium: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
        color: textDarkColor,
        fontFamily: font,
      ),
      titleSmall: TextStyle(
        fontSize: 7.sp,
        fontWeight: FontWeight.w400,
        color: textLightColor,
        fontFamily: font,
      ),
      bodyLarge: TextStyle(
        fontSize: 6.sp,
        fontWeight: FontWeight.w500,
        color: textDarkColor,
        fontFamily: font,
      ),
      bodyMedium: TextStyle(
        fontSize: 5.sp,
        fontWeight: FontWeight.w400,
        color: textLightColor,
        fontFamily: font,
      ),
      labelLarge: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: textLightColor,
        fontFamily: font,
      ),
    ),
  );
}
