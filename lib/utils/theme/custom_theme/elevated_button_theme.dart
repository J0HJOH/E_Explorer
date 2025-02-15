import 'package:e_explore/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EElevatedButtonTheme {
  EElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: EColors.secondaryColor,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              side: const BorderSide(color: EColors.secondaryColor),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle:
                  const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))));

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: EColors.secondaryColor,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              side: const BorderSide(color: EColors.secondaryColor),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))));
}
