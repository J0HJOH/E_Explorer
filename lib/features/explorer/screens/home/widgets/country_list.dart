import 'package:e_explore/data/provider/country_provider.dart';
import 'package:e_explore/features/explorer/screens/home_detail/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/model/country_model.dart';
import '../../../../../utils/constants/sizes.dart';

class CountryList extends StatelessWidget {
  const CountryList({
    super.key,
    required this.sortedEntries,
  });

  final List<MapEntry<String, List<CountryModel>>> sortedEntries;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CountryProvider>();

    return ListView.builder(
      itemCount: sortedEntries.length,
      itemBuilder: (context, index) {
        final entry = sortedEntries[index];
        final letter = entry.key;
        final countries = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                letter, // Section header
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
            ),
            ListView.builder(
              itemCount: countries.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, countryIndex) {
                final eachCountry = countries[countryIndex];
                final countryName = eachCountry.name?.common! ?? '';
                final defaultFlag =
                    'https://cdn.pixabay.com/photo/2017/03/14/21/00/american-flag-2144392_960_720.png';
                final countryFlag = eachCountry.flags?.png! ?? defaultFlag;
                final isNotEng = controller.selectedLanguage.value.isNotEmpty;

                return GestureDetector(
                  onTap: () {
                    controller.setSelectedCountry(eachCountry);
                    Get.to(() => CountryDetail());
                  },
                  child: ListTile(
                    leading: Container(
                      width: ESizes.iconLg,
                      height: ESizes.iconLg,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Image.network(countryFlag),
                    ),
                    // if  selected language is end return all countries else return filtered countries in that language

                    title: Text(
                      (!isNotEng || controller.selectedLanguage.value == 'eng')
                          ? eachCountry.name?.common! ??
                              'This country has no name'
                          // return name in that language
                          : eachCountry
                                  .translations?[
                                      controller.selectedLanguage.value]
                                  ?.official ??
                              'Not Named in this Language',
                      style: Theme.of(context).textTheme.headlineMedium!,
                    ),
                    subtitle: Text(
                      'Capital: ${eachCountry.capital?.join('\n') ?? 'No Capital City'}',
                      style: Theme.of(context).textTheme.headlineSmall!,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
