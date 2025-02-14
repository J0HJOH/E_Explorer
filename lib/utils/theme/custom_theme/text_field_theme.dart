import 'package:e_explore/utils/constants/colors.dart';
import 'package:e_explore/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ETextFieldTheme {
  ETextFieldTheme._();

  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(color: Colors.black, fontSize: 14),
    hintStyle:
        const TextStyle().copyWith(color: Colors.black, fontSize: ESizes.lg),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: InputBorder.none,
    fillColor: EColors.hintBackground,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.black12, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.orange, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
  );

  ///darkMode
  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(color: Colors.white, fontSize: 14),
    hintStyle:
        const TextStyle().copyWith(color: EColors.darkGrey, fontSize: 24),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    filled: true,
    fillColor: EColors.hintBackgroundDark,
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.white, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.orange, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
  );
}
