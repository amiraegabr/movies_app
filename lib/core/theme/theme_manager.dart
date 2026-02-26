import 'package:flutter/material.dart';

import 'app_colors.dart';

class ThemeManager {
  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.yellow,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.yellow),
        titleTextStyle: TextStyle(color: AppColors.yellow, fontSize: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow,
          foregroundColor: AppColors.black,
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 24),
        unselectedIconTheme: IconThemeData(size: 24),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.white,
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: AppColors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: TextStyle(
          //16
          color: AppColors.white,
        ),
      ),
    );
  }
}
