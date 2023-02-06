import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange1 = const <int, Color>{
    50: const Color(0xFFFCF2E7),
    100: const Color(0xFFF8DEC3),
    200: const Color(0xFFF3C89C),
    300: const Color(0xFFEEB274),
    400: const Color(0xFFEAA256),
    500: const Color(0xFFE69138),
    600: const Color(0xFFE38932),
    700: const Color(0xFFDF7E2B),
    800: const Color(0xFFDB7424),
    900: const Color(0xFFD56217)
  };

  static const Map<int, Color> appBlueMaterial = {
    50: Color.fromRGBO(86,59,255, .1),
    100: Color.fromRGBO(86,59,255, .2),
    200: Color.fromRGBO(86,59,255, .3),
    300: Color.fromRGBO(86,59,255, .4),
    400: Color.fromRGBO(86,59,255, .5),
    500: Color.fromRGBO(86,59,255, .6),
    600: Color.fromRGBO(86,59,255, .7),
    700: Color.fromRGBO(86,59,255, .8),
    800: Color.fromRGBO(86,59,255, .9),
    900: Color.fromRGBO(86,59,255, 1),
  };
  //static const Color appBlue= const Color(0xFF4C7DF5);
  static const Color appBlue= const Color(0xFF3470DE);
  static const Color blueShade= const Color(0xFF4C7DF5);
  static const Color lightBlue= const Color(0xFFf1f5fd);
  static const Color indicatorActive= const Color(0xFF414141);
  static const Color pink= const Color(0xFFCE4CF5);
  static const Color orange= const Color(0xFFF3A708);
  static const Color orangeShade= const Color(0xFFF15400);
  static const Color yellow= const Color(0xFFF2D22E);
  static const Color yellowShade= const Color(0xFFF3A708);
  static const Color red= const Color(0xFFE8371A);
  static const Color blue= const Color(0xFF1E22D9);
  static const Color purple= const Color(0xFFA45AC3);
  static const Color lightGreen= const Color(0xFF5AB5BF);
  static const Color redShade= const Color(0xFFCA0206);
  static const Color redOffer= const Color(0xFFE20000);
  static const Color blackShade= const Color(0xFF414141);
  static const Color blackHistoryShade= const Color(0xFF3B3B3B);
  static const Color greenShade= const Color(0xFF00B65B);
  static const Color greenShadeBalance= const Color(0xFF1FB500);
  static const Color greyShade= const Color(0xFFAFAFAF);
  static const Color greyBorderShade= const Color(0xFFE2E2E2);
  static const Color greyIconShade= const Color(0xFFCBCBCB);
  static const Color greyDark= const Color(0xFF757575);
  static const Color darkThemeCard= const Color(0xFF484848);
  static const Color darkThemebg= const Color(0xFF010919);
  static const Color darkText= const Color(0xFF121212);
  static const Color posPrimary= const Color(0xFF563BFF);
  static const Color darkPink= const Color(0xFFC90093);
  static const Color posCream= const Color(0xFFFFEBE4);
  static const Color posBrown= const Color(0xFFC24C4C);
  static const Color posGrey= const Color(0xFFEEEEEE);
  static const Color posGreen= const Color(0xFFcdffe4);
  static const Color posYellow= const Color(0xFFfff4be);
  static const Color posLightBlue= const Color(0xFFdee2ff);
  static const Color posLightBlueShade= const Color(0xFFeceff7);
  static const Color posLightPink= const Color(0xFFffeafb);
  static const Color posLightRed= const Color(0xFFf0d3d7);
  static const Color posLightPurple= const Color(0xFFede6f1);
  static const Color posInkPurple= const Color(0xFF3B0273);
  static const Color posPurple= const Color(0xFFF5E5FD);
  static const Color posSky= const Color(0xFFD6EFFF);
  static const Color posOrange= const Color(0xFFFFE0CF);
  static const Color posPurpleShade= const Color(0xFFEACDF8);
  static const Color noteColor= const Color(0xFFef6c00);


  static const List<Color> itemColors = [AppColors.yellow,AppColors.red,AppColors.blue,AppColors.purple,AppColors.lightGreen];

}
