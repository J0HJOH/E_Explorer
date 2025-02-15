import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class IconTButtonWidget extends StatelessWidget {
  const IconTButtonWidget({
    super.key,
    this.onTap,
    required this.icon,
    this.buttonText,
  });

  final void Function()? onTap;
  final IconData icon;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 76,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: EColors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Flexible(
                child: Text(
              buttonText ?? '',
              style: Theme.of(context).textTheme.bodyMedium!,
            ))
          ],
        ),
      ),
    );
  }
}
