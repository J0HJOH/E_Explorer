import 'package:e_explore/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../data/provider/country_provider.dart';
import '../../../../../utils/constants/sizes.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.controller,
  });

  final CountryProvider controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onChanged: (value) => controller.searchCountry(value),
      style: Theme.of(context).textTheme.titleMedium!,
      decoration: InputDecoration(
        hintText: 'Search Country',
        hintStyle: theme.inputDecorationTheme.hintStyle,
        filled: theme.inputDecorationTheme.filled,
        fillColor: theme.inputDecorationTheme.fillColor,
        prefixIcon: const Icon(Icons.search),
        border: theme.inputDecorationTheme.border,
        focusedBorder: theme.inputDecorationTheme.focusedBorder,
        enabledBorder: theme.inputDecorationTheme.enabledBorder,
      ),
    );
  }
}
