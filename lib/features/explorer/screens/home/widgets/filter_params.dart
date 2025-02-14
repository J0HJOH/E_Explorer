import 'package:flutter/material.dart';

import '../../../../../common/widgets/double_header.dart';
import '../../../../../common/widgets/icon_button.dart';

class FilterParams extends StatelessWidget {
  const FilterParams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DoubleComponentHeader(
      leftWidget: IconTButtonWidget(
        icon: Icons.web_rounded,
        onTap: () {},
        buttonText: "EN",
      ),
      rightWidget: IconTButtonWidget(
        icon: Icons.filter_4,
        onTap: () {},
        buttonText: "Filter",
      ),
    );
  }
}
