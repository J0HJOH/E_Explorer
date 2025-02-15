import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/e_card_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class FlagSlider extends StatelessWidget {
  const FlagSlider({
    super.key,
    required this.currentPic,
    required this.countryImages,
    required this.dark,
  });

  final RxString currentPic;
  final List<String> countryImages;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          /// 🖼️ Main Large Image (Updates when a thumbnail is clicked)
          Obx(() => SizedBox(
                height: 300,
                child: Padding(
                  padding: EdgeInsets.all(ESizes.countryImageRadius),
                  child: Center(
                    child: Image.network(currentPic.value),
                  ),
                ),
              )),

          /// 📌 Image Slider (Thumbnail List)
          if (countryImages.isNotEmpty)
            Positioned(
              bottom: 30,
              right: 0,
              left: ESizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: countryImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        currentPic.value =
                            countryImages[index]; // 🔄 Update main image
                      },
                      child: ECardImage(
                        width: 80,
                        isNetworkImage: true,
                        backgroundColor: dark ? EColors.dark : EColors.white,
                        border: Border.all(color: EColors.primaryColor),
                        padding: const EdgeInsets.all(ESizes.sm),
                        imageUrl: countryImages[index],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: ESizes.spaceBtwItems),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
