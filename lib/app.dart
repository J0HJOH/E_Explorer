import 'package:e_explore/features/explorer/screens/home/home_screen.dart';
import 'package:e_explore/utils/constants/sizes.dart';
import 'package:e_explore/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/personalization/controllers/theme_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize theme controller
    final ThemeController themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      themeMode:
          themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      darkTheme: EAppTheme.darkTheme,
      theme: EAppTheme.lightTheme,
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
