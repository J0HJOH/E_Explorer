import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/double_header.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../personalization/controllers/theme_controller.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return DoubleComponentHeader(
      leftWidget: Text('Explore',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontFamily: "Oleo")),
      rightWidget: IconButton(
        icon: Icon(dark ? Icons.nightlight_round : Icons.wb_sunny),
        iconSize: ESizes.iconMd + 6,
        onPressed: () {
          Get.find<ThemeController>().toggleTheme();
        },
      ),
    );
  }
}
