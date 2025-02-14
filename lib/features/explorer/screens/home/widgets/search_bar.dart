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
        hintText: 'Search Country',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ESizes.borderRadiuSm),
        ),
      ),
    );
  }
}
