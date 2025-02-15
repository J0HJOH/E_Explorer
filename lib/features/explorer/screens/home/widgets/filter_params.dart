import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/double_header.dart';
import '../../../../../common/widgets/icon_button.dart';
import '../../../controllers/filter_controller.dart';
import '../../../controllers/language_controller.dart';
import 'filter_modal.dart';
import 'language_modal.dart';

class FilterParams extends StatelessWidget {
  const FilterParams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final langController = Get.put(LanguageController());

    return DoubleComponentHeader(
      leftWidget: IconTButtonWidget(
        icon: Icons.web_rounded,
        onTap: () {
          _showBottomSheet(LanguageModal());
        },
        buttonText: langController.selectedLanguage.value,
      ),
      rightWidget: IconTButtonWidget(
        icon: Icons.filter_4,
        onTap: () {
          _showBottomSheet(FilterModal());
        },
        buttonText: "Filter",
      ),
    );
  }

  void _showBottomSheet(Widget content) {
    final theme = Theme.of(Get.context!);

    Get.bottomSheet(
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(Get.context!).bottomSheetTheme.modalBackgroundColor,
          ),
          child: content,
        ),
        isScrollControlled: true,
        backgroundColor: theme.bottomSheetTheme.modalBackgroundColor,
        shape: theme.bottomSheetTheme.shape);
  }
}
