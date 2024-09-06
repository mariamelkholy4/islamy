import 'package:flutter/material.dart';
import 'package:islamii_app/AppColors.dart';

class MyTheme {
  static final ThemeData lightmode = ThemeData(
    canvasColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor : Colors.transparent,
    appBarTheme:AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        elevation: 0,
        centerTitle: true
    ),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blackColor,
      showUnselectedLabels: true,

    ) ,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color:AppColors.blackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
          color:AppColors.blackColor,
          fontSize: 30,
          fontWeight: FontWeight.w700
      ),
    ),

  );
  static final ThemeData Darkmode = ThemeData(
    canvasColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor : Colors.transparent,
    appBarTheme:AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        elevation: 0,
        centerTitle: true
    ),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellowColor,
      showUnselectedLabels: true,

    ) ,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.primaryDarkColor
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color:AppColors.whiteColor,
          fontSize: 30,
          fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
          color:AppColors.whiteColor,
          fontSize: 30,
          fontWeight: FontWeight.w700
      ),
      bodySmall: TextStyle(
          color:AppColors.whiteColor,
          fontSize: 25,
          fontWeight: FontWeight.w700
      ),
    ),

  );
}