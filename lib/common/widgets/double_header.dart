import 'package:flutter/material.dart';

class DoubleComponentHeader extends StatelessWidget {
  const DoubleComponentHeader({
    super.key,
    this.rightWidget,
    required this.leftWidget,
  });

  final Widget? rightWidget;
  final Widget leftWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [leftWidget, rightWidget ?? Container()],
    );
  }
}
