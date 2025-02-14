import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/outlinedbutton_theme.dart';

class EAppTheme {
//   this constructor is done to ensure this is not used over and over again

  EAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: EColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    checkboxTheme: ECheckboxTheme.lightCheckboxTheme,
    // bottomSheetTheme: SBottomSheetTheme.lightBottomSheetTheme,
    // elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButton.lightOutlinedButton,
    // inputDecorationTheme: STextFieldTheme.lightTextFieldTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    // textTheme: STextTheme.darkTextTheme,
    // chipTheme: SChipTheme.darkChipTheme,
    // appBarTheme: SAppBarTheme.darkAppBarTheme,
    checkboxTheme: ECheckboxTheme.darkCheckboxTheme,
    // bottomSheetTheme: SBottomSheetTheme.darkBottomSheetTheme,
    // elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButton.darkOutlinedButton,
    // inputDecorationTheme: STextFieldTheme.darkTextFieldTheme,
  );
}
