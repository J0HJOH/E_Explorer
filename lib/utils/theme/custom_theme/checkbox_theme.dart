import 'package:flutter/material.dart';

class ECheckboxTheme {
  ECheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) =>
        (states.contains(WidgetState.selected)) ? Colors.white : Colors.black),
    fillColor: WidgetStateProperty.resolveWith((states) =>
        (states.contains(WidgetState.selected))
            ? Colors.black
            : Colors.transparent),
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) =>
        (states.contains(WidgetState.selected)) ? Colors.black : Colors.white),
    fillColor: WidgetStateProperty.resolveWith((states) =>
        (states.contains(WidgetState.selected))
            ? Colors.white
            : Colors.transparent),
  );
}
