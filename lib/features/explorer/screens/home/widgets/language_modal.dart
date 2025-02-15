import 'package:e_explore/common/widgets/double_header.dart';
import 'package:e_explore/data/provider/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/language_controller.dart';

class LanguageModal extends StatelessWidget {
  const LanguageModal({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LanguageController>();
    final countriesController = Get.find<CountryProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      countriesController
          .setSelectedLanguage(controller.selectedLanguage.value);
    });

    final List<String> languages = [
      'English',
      'Arabic',
      'France',
      'Russia',
      'Korea',
      'Japanese',
      'Chinese'
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DoubleComponentHeader(
            leftWidget:
                Text('Language', style: Theme.of(context).textTheme.bodyLarge!),
            rightWidget: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.cancel)),
          ),
          SizedBox(height: 16),
          Column(
            children: languages.map((language) {
              return Obx(() => ListTile(
                    title: Text(
                      language,
                      style: Theme.of(context).textTheme.bodyLarge!,
                    ),

                    trailing: Radio<String>(
                      fillColor: Theme.of(context).radioTheme.fillColor,
                      value: language,
                      groupValue: controller.selectedLanguage.value,
                      onChanged: (newValue) {
                        controller.selectedLanguage.value = newValue!;
                      },
                    ),
                    onTap:
                        () {}, // Prevents the entire tile from being clickable
                  ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
