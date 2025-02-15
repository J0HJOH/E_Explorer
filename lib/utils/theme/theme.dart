import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outlinedbutton_theme.dart';
import 'custom_theme/radio_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';
import 'custom_theme/app_bar_theme.dart';

class EAppTheme {
//   this constructor is done to ensure this is not used over and over again

  EAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Raleway',
    brightness: Brightness.light,
    primaryColor: EColors.primaryColor,
    textTheme: ETextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    chipTheme: EChipTheme.lightChipTheme,
    checkboxTheme: ECheckboxTheme.lightCheckboxTheme,
    radioTheme: ERadioTheme.lightRadioTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: EAppBarTheme.lightAppBarTheme,
    outlinedButtonTheme: EOutlinedButton.lightOutlinedButton,
    inputDecorationTheme: ETextFieldTheme.lightTextFieldTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Raleway',
    brightness: Brightness.dark,
    primaryColor: EColors.primaryColor,
    scaffoldBackgroundColor: EColors.dark,
    textTheme: ETextTheme.darkTextTheme,
    chipTheme: EChipTheme.darkChipTheme,
    checkboxTheme: ECheckboxTheme.darkCheckboxTheme,
    radioTheme: ERadioTheme.darkRadioTheme,
    appBarTheme: EAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: EBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButton.darkOutlinedButton,
    inputDecorationTheme: ETextFieldTheme.darkTextFieldTheme,
  );
}
