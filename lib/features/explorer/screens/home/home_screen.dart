import 'package:e_explore/common/widgets/double_header.dart';
import 'package:e_explore/data/provider/country_provider.dart';
import 'package:e_explore/features/explorer/screens/home/widgets/search_bar.dart';
import 'package:e_explore/features/personalization/controllers/theme_controller.dart';
import 'package:e_explore/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_explore/utils/constants/sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<HomeScreen> {
  final controller = Get.put(CountryProvider());

  @override
  Widget build(BuildContext context) {
    final bool dark = EHelperFunction.isDarkMode(context);

    return Column(
      children: [
        Padding(padding: EdgeInsets.all(ESizes.defaultSpace)),
        DoubleComponentHeader(
          leftWidget: Text(
            'Explore',
            style: TextStyle(
                fontSize: ESizes.fontSizeLg + 10, fontWeight: FontWeight.bold),
          ),
          rightWidget: IconButton(
            icon: Icon(dark ? Icons.nightlight_round : Icons.wb_sunny),
            iconSize: ESizes.iconMd + 6,
            onPressed: () {
              Get.find<ThemeController>().toggleTheme();
            },
          ),
        ),
        SizedBox(height: ESizes.defaultSpace),
        SearchBarWidget(controller: controller),
      ],
    );
  }
}
