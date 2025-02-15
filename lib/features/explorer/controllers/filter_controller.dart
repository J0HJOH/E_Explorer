// GetX Controller for Managing Checkbox State
import 'package:get/get.dart';

class FilterController extends GetxController {
  final RxList<String> selectedContinents = <String>[].obs;
  final isDropdownOpen = false.obs;
  // final RxList<String> timeZone = <String>[].obs;
}
