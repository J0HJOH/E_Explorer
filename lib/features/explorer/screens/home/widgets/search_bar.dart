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
    return TextField(
      onChanged: (value) {
        controller.searchCountry(value);
      },
      decoration: InputDecoration(
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        filled: Theme.of(context).inputDecorationTheme.filled,
        hintText: 'Search Country',
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        prefixIcon: Icon(Icons.search),
        border: Theme.of(context).inputDecorationTheme.border,
      ),
    );
  }
}
