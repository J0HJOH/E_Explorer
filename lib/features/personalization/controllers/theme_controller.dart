import 'package:e_explore/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Observable variable to track theme state
  final Rx<bool> isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Check if the theme is dark mode or not after widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isDarkMode.value =
          EHelperFunction.isDarkMode(Get.context ?? Get.overlayContext!);
    });
  }

  // Function to toggle theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
