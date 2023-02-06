/**
 * Creating custom color palettes is part of creating a custom app. The idea is to create
 * your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
 * object with those colors you just defined.
 *
 * Resource:
 * A good resource would be this website: http://mcg.mbitson.com/
 * You simply need to put in the colour you wish to use, and it will generate all shades
 * for you. Your primary colour will be the `500` value.
 *
 * Colour Creation:
 * In order to create the custom colours you need to create a `Map<int, Color>` object
 * which will have all the shade values. `const Color(0xFF...)` will be how you create
 * the colours. The six character hex code is what follows. If you wanted the colour
 * #114488 or #D39090 as primary colours in your theme, then you would have
 * `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
 *
 * Usage:
 * In order to use this newly created theme or even the colours in it, you would just
 * `import` this file in your project, anywhere you needed it.
 * `import 'path/to/theme.dart';`
 */

import 'package:app_briidea/constants/font_family.dart';
import 'package:flutter/material.dart';
import 'package:app_briidea/constants/colors.dart';
import 'package:app_briidea/constants/font_family.dart';

// ignore: unnecessary_new
final ThemeData themeData = new ThemeData(
  fontFamily: FontFamily.hedley,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  primarySwatch:
      MaterialColor(AppColors.posPrimary.value, AppColors.appBlueMaterial),
  primaryColor: AppColors.posPrimary,
  primaryColorBrightness: Brightness.light,
  accentColor: AppColors.posPrimary,
  accentColorBrightness: Brightness.light,
  cardColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    ///light
    bodyText1: TextStyle(
        fontFamily: FontFamily.hedley,
        fontWeight: FontWeight.w300,
        color: AppColors.blackShade),
    caption: TextStyle(
        fontFamily: FontFamily.hedley,
        fontWeight: FontWeight.w700,
        color: AppColors.blackShade),

    ///regular
    
    
    subtitle1: TextStyle(
        fontFamily: FontFamily.hedley,
        fontWeight: FontWeight.w400,
        color: AppColors.blackShade),

    ///medium
    subtitle2: TextStyle(
        fontFamily: FontFamily.hedley,
        fontWeight: FontWeight.w500,
        color: AppColors.blackShade),

    ///bold
    headline6: TextStyle(
        fontFamily: FontFamily.hedley,
        fontWeight: FontWeight.w700,
        color: AppColors.blackShade),

    //  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);

final ThemeData themeDataDark = ThemeData(
  scaffoldBackgroundColor: AppColors.darkThemebg,
  fontFamily: FontFamily.hedley,
  brightness: Brightness.dark,
  backgroundColor: AppColors.darkThemebg,
  primarySwatch:
      MaterialColor(AppColors.posPrimary.value, AppColors.appBlueMaterial),
  primaryColor: AppColors.posPrimary,
  primaryColorBrightness: Brightness.dark,
  accentColor: AppColors.posPrimary,
  accentColorBrightness: Brightness.dark,
  cardColor: AppColors.darkThemeCard,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontFamily: FontFamily.hedley,
      fontWeight: FontWeight.w300,
    ),
    caption: TextStyle(
      fontFamily: FontFamily.hedley,
      fontWeight: FontWeight.w700,
    ),
    subtitle1: TextStyle(
      fontFamily: FontFamily.hedley,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: TextStyle(
      fontFamily: FontFamily.hedley,
      fontWeight: FontWeight.w500,
    ),
    headline6: TextStyle(
      fontFamily: FontFamily.hedley,
      fontWeight: FontWeight.w700,
    ),
    // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);
