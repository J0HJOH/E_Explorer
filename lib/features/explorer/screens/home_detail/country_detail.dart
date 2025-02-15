import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/images/e_card_image.dart';
import '../../../../data/provider/country_provider.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../personalization/controllers/theme_controller.dart';
import 'widgets/flag_slider.dart';

class CountryDetail extends StatefulWidget {
  const CountryDetail({super.key});

  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CountryProvider>();
    final country = controller.selectedCountry.value;
    if (country == null) {
      return Scaffold(
        appBar: AppBar(title: Text("No Data")),
        body: Center(child: Text("Country details not available.")),
      );
    }

    final dark = Get.find<ThemeController>().isDarkMode.value;
    final defaultFlag =
        'https://cdn.pixabay.com/photo/2017/03/14/21/00/american-flag-2144392_960_720.png';

    // List of available images (flags & coat of arms)
    final List<String> countryImages = [
      if (country.flags?.png != null) country!.flags!.png!,
      if (country.coatOfArms?.png != null) country!.coatOfArms!.png!,
      if (country.coatOfArms?.svg != null) country!.coatOfArms!.svg!,
    ];

    if (countryImages.isEmpty) {
      countryImages.add(defaultFlag);
    }

    // Ensure there's a fallback image
    final RxString currentPic =
        (countryImages.isNotEmpty ? countryImages.first : defaultFlag).obs;

    return Scaffold(
      appBar: AppBar(
        title: Text(country?.name?.common ?? ''),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🖼️ Flag Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                ),
                items: countryImages.isNotEmpty
                    ? countryImages.map((imageUrl) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList()
                    : [
                        Image.network(defaultFlag, fit: BoxFit.cover),
                      ],
              ),

              const SizedBox(height: ESizes.defaultSpace),

              /// 🌍 Country Details (Replace `Expanded` with `Padding` or `SizedBox`)
              _buildCountryDetailSection("Population", country?.population),
              _buildCountryDetailSection("Region", country?.region),
              _buildCountryDetailSection(
                  "Capital", country?.capital?.join('\n') ?? 'Unknown'),
              _buildCountryDetailSection(
                  "Motto", country?.altSpellings?.join('|')),

              const SizedBox(height: ESizes.defaultSpace),

              _buildCountryDetailSection("Official Language",
                  country?.languages?.values.join(',') ?? 'Unknown'),
              _buildCountryDetailSection(
                  "Ethnic Group", country?.demonyms?.eng),
              _buildCountryDetailSection("Religion", country?.status),
              _buildCountryDetailSection("Government", country?.subregion),

              const SizedBox(height: ESizes.defaultSpace),

              _buildCountryDetailSection("Independent", country.independent),
              _buildCountryDetailSection("Area", "${country.area ?? ''} km²"),
              _buildCountryDetailSection(
                  "Currency",
                  (country.currencies?.values.isNotEmpty ?? false)
                      ? country.currencies!.values.first.name
                      : 'Unknown'),

              const SizedBox(height: ESizes.defaultSpace),

              _buildCountryDetailSection(
                  "Time Zone", country?.timezones?.join(',') ?? 'Unknown'),
              _buildCountryDetailSection("Date Format", "dd/mm/yyyy"),
              _buildCountryDetailSection("Dialing Code",
                  "${country?.idd?.root ?? ''}${country?.idd?.suffixes?.join('') ?? ''}"),
              _buildCountryDetailSection("Driving Side", country?.car?.side),

              const SizedBox(height: ESizes.defaultSpace),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Helper function to build country details section
  Widget _buildCountryDetailSection(String title, dynamic value) {
    final dark = Get.find<ThemeController>().isDarkMode.value;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              // title
              Text(
                '$title : ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              // value
              Expanded(
                child: Text(
                  '${value ?? 'UnKnown'}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: dark ? Color(0xF2F4F7) : Color(0xFF1C1917)),
                ),
              )
            ],
          ),
        ));
  }
}
