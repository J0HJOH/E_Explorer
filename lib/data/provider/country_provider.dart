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

  // store selected country value in an observable
  final Rx<CountryModel?> selectedCountry = Rx<CountryModel?>(null);

// a getter to expose the list of countries
  RxList<CountryModel> get countries => _filteredCountries;
  // Store selected filters
  final RxList<String> selectedContinents = <String>[].obs;
  final RxString selectedLanguage = ''.obs;

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

  // 🔹 Filter by Continent
  void filterByContinent(String continent) {
    _filteredCountries.value = _allcountries
        .where((country) => country.continents?.contains(continent) ?? false)
        .toList();
  }

  // 🔹 Filter by Time Zone
  void filterByTimeZone(String timeZone) {
    _filteredCountries.value = _allcountries
        .where((country) => country.timezones?.contains(timeZone) ?? false)
        .toList();
  }

  // 🔹 Filter by Population (Min Population)
  void filterByPopulation(int minPopulation) {
    _filteredCountries.value = _allcountries
        .where((country) => (country.population ?? 0) >= minPopulation)
        .toList();
  }

  // Set Language Filter
  void setSelectedLanguage(String language) {
    // assign selected language value to the first three characters of the Language passed in lowercase
    final modelLan = language.isNotEmpty
        ? (language == 'Japanese'
            ? 'jpn'
            : language == 'Chinese'
                ? 'zho'
                : language.substring(0, 3).toLowerCase())
        : ''; //eg swe for Sweden
    selectedLanguage.value = modelLan;
    applyFilters();
  }

  // Set Continent Filter (supports multiple selections)
  void setSelectedContinents(List<String> continents) {
    selectedContinents.assignAll(continents);
    applyFilters();
  }

  // Apply all filters (Continents, Language, and Search)
  void applyFilters() {
    List<CountryModel> filtered = _allcountries.toList();

    // 🔹 Filter by Continents (if any selected)
    if (selectedContinents.isNotEmpty) {
      filtered = filtered
          .where((country) =>
              country.continents?.any((c) => selectedContinents.contains(c)) ??
              false)
          .toList();
    }

    // 🔹 Filter by Language (if a language is selected)
    if (selectedLanguage.value.isNotEmpty) {
      filtered = filtered.where((country) {
        // Ensure the country has translations and the selected language exists in it
        if (country.translations != null &&
            country.translations!.containsKey(selectedLanguage.value)) {
          return true; // Keep this country in the filtered list
        }
        return false; // Otherwise, remove it
      }).toList();

      print(
          "Filtered: ${filtered.map((count) => count.translations?[selectedLanguage.value]?.official)}");
      print("FilteredList: ${filtered.map((count) => count.name?.common)}");
    }

    // 🔹 Filter by Search Text
    if (searchText.isNotEmpty) {
      filtered = filtered
          .where((country) =>
              country.name?.common
                  ?.toLowerCase()
                  .contains(searchText.value.toLowerCase()) ??
              false)
          .toList();
    }

    // notcalled
    print("Data1234:  ${filtered[0].name?.common ?? ''}");

    // notcalled
    print("Data: hjef ${_filteredCountries[0].name?.common ?? ''}");

    // Apply final filtered list
    _filteredCountries.assignAll(filtered);
  }

  // 🔹 Filter by Size (Min Area)
  void filterBySize(double minArea) {
    _filteredCountries.value = _allcountries
        .where((country) => (country.area ?? 0) >= minArea)
        .toList();
  }

// set the user selection to save state
  void setSelectedCountry(CountryModel country) {
    selectedCountry.value = country;
  }

// Reset filters to show all countries
  void resetFilters() {
    searchText.value = '';
    _filteredCountries.assignAll(_allcountries);
  }
}
