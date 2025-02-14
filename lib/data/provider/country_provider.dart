import 'package:e_explore/data/model/country_model.dart';
import 'package:e_explore/data/services/http_service.dart';
import 'package:get/get.dart';

class CountryProvider extends GetxController {
  // a private field to hold the list of countries
  final RxList<CountryModel> _allcountries = <CountryModel>[].obs;
  // a private field to return a filtered list of countries
  final RxList<CountryModel> _filteredCountries = <CountryModel>[].obs;
  final searchText = ''.obs;
  final isLoading = true.obs;

// a getter to expose the list of countries
  RxList<CountryModel> get countries => _filteredCountries;

  @override
  void onInit() {
    // load data on startup
    fetchCountries();
    super.onInit();
  }

  // Fetch countries from the API
  Future<void> fetchCountries() async {
    try {
      isLoading(true);
      // fetch countries from the API
      final List<CountryModel> countries = await EHttpService.fetchCountries();
      // assign the fetched countries to the private field
      _allcountries.assignAll(countries);
      // assign the fetched countries to the filtered countries
      _filteredCountries.assignAll(countries);
    } finally {
      isLoading(false);
    }
  }

  // Filter countries based on search text
  void searchCountry(String text) {
    searchText.value = text;
    if (text.isEmpty) {
      _filteredCountries.assignAll(_allcountries);
    } else {
      _filteredCountries.assignAll(_allcountries
          .where((country) =>
              country.name!.common!.toLowerCase().contains(text.toLowerCase()))
          .toList());
    }
  }

// Reset filters to show all countries
  void resetFilters() {
    searchText.value = '';
    _filteredCountries.assignAll(_allcountries);
  }
}
