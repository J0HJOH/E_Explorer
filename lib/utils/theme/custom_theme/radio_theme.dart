import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ERadioTheme {
  ERadioTheme._();

  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) =>
        (states.contains(WidgetState.selected))
            ? Colors.black
            : Colors.transparent),
    overlayColor:
        WidgetStatePropertyAll(EColors.secondaryColor.withOpacity(0.2)),
    visualDensity: VisualDensity.compact,
  );

  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) =>
        (states.contains(WidgetState.selected))
            ? Colors.white
            : Colors.transparent),
    overlayColor:
        WidgetStatePropertyAll(EColors.secondaryColor.withOpacity(0.2)),
    visualDensity: VisualDensity.compact,
  );
}
