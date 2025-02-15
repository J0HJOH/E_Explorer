import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/filter_controller.dart';

class FilterModal extends StatelessWidget {
  final FilterController filterController = Get.put(FilterController());

  final List<String> continents = [
    "Africa",
    "Asia",
    "Europe",
    "North America",
    "South America",
    "Australia",
    "Antarctica"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Filters",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),

        // Filter dropdown
        Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dropdown Header (Text acting as a dropdown)
                GestureDetector(
                  onTap: () => filterController.isDropdownOpen.toggle(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            filterController.selectedContinents.isEmpty
                                ? "Select Continents"
                                : filterController.selectedContinents
                                    .join(", "),
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(Get.context!).textTheme.bodyMedium!,
                          ),
                        ),
                        Icon(filterController.isDropdownOpen.value
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),

                // Dropdown List (Visible when isDropdownOpen is true)
                if (filterController.isDropdownOpen.value)
                  Column(
                    children: continents.map((continent) {
                      return Obx(() => CheckboxListTile(
                            title: Text(continent),
                            value: filterController.selectedContinents
                                .contains(continent),
                            onChanged: (bool? selected) {
                              if (selected == true) {
                                filterController.selectedContinents
                                    .add(continent);
                              } else {
                                filterController.selectedContinents
                                    .remove(continent);
                              }
                            },
                          ));
                    }).toList(),
                  ),
              ],
            )),

        SizedBox(height: 16),
        // Close button
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () => Get.back(),
            child: Text("Close"),
          ),
        ),
      ],
    );
  }
}
