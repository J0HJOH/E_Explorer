import 'package:e_explore/common/widgets/double_header.dart';
import 'package:e_explore/data/provider/country_provider.dart';
import 'package:e_explore/features/explorer/screens/home/widgets/search_bar.dart';
import 'package:e_explore/features/personalization/controllers/theme_controller.dart';
import 'package:e_explore/utils/constants/colors.dart';
import 'package:e_explore/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_explore/utils/constants/sizes.dart';

import '../../../../common/widgets/icon_button.dart';
import 'widgets/explore_header.dart';
import 'widgets/filter_params.dart';

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
        // Explore Header
        ExploreHeader(dark: dark),

        SizedBox(height: ESizes.defaultSpace),

        // SearchBar
        SearchBarWidget(controller: controller),

        SizedBox(height: ESizes.defaultSpace),

        // Filter Params
        FilterParams(),

        //  List of filtered countries
        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.countries.isEmpty) {
              return const Center(child: Text("No countries found."));
            }
            return ListView.builder(
              itemCount: controller.countries.length,
              itemBuilder: (context, index) {
                final eachCountry = controller.countries[index];
                return ListTile(
                  title: Text(
                    eachCountry.name!.common! ?? 'This country has no name',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  subtitle: Text(eachCountry.status! ?? ''),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
