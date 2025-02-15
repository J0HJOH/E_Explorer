import 'package:e_explore/common/widgets/double_header.dart';
import 'package:e_explore/data/model/country_model.dart';
import 'package:e_explore/data/provider/country_provider.dart';
import 'package:e_explore/features/explorer/screens/home/widgets/search_bar.dart';
import 'package:e_explore/features/personalization/controllers/theme_controller.dart';
import 'package:e_explore/utils/constants/colors.dart';
import 'package:e_explore/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_explore/utils/constants/sizes.dart';

import '../../../../common/widgets/icon_button.dart';
import 'widgets/country_list.dart';
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

        SizedBox(height: ESizes.defaultSpace / 2),
        // List of filtered countries grouped by first letter
        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.countries.isEmpty) {
              return const Center(child: Text("No countries found."));
            }

            // Sort and Group countries by first letter
            final Map<String, List<CountryModel>> groupedCountries = {};
            for (var country in controller.countries) {
              final firstLetter = country.name?.common?[0].toUpperCase() ?? '#';
              groupedCountries.putIfAbsent(firstLetter, () => []).add(country);
            }

            // Converting map to a sorted list of entries
            final sortedEntries = groupedCountries.entries.toList()
              ..sort((a, b) => a.key.compareTo(b.key));

            // Return sorted country list with their respecting starting letter
            return CountryList(sortedEntries: sortedEntries);
          }),
        ),
      ],
    );
  }
}
