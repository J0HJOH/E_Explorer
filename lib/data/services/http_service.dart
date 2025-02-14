import 'package:e_explore/data/model/country_model.dart';
import 'package:e_explore/utils/http/http_client.dart';

class EHttpService {
  static Future<List<CountryModel>> fetchCountries() async {
    try {
      List<dynamic> responseJson = await EHttpHelper.get();
      print("converting to model type");
      List<CountryModel> myResp =
          responseJson.map((json) => CountryModel.fromJson(json)).toList();

      print("converted");
      return myResp;
    } catch (e) {
      throw Exception('Failed to parse country data: $e');
    }
  }
}
