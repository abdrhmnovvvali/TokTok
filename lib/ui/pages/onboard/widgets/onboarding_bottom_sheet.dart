import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/extensions/num_extension.dart';
import '../../../widgets/custom_button.dart';

class OnboardingBottomSheet extends StatelessWidget {
  final PageController controller;
  final int pageCount;
  final String title;
  final String description;

  const OnboardingBottomSheet({
    super.key,
    required this.controller,
    required this.pageCount,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 463,
      width: 428,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: AppColors.bottomSheetColor,
              blurRadius: 40,
              // offset: Offset(0, -5),
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
              height: 3,
              width: 38,
              child: ColoredBox(
                color: AppColors.windChime,
              )),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.h,
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          40.h,
          SmoothPageIndicator(
            controller: controller,
            count: pageCount,
            effect: const WormEffect(
              spacing: 12,
              dotWidth: 6,
              dotHeight: 6,
              activeDotColor: Colors.redAccent,
              dotColor: AppColors.dotColor,
            ),
          ),
          40.h,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                color: Colors.white,
                backgroundColor: AppColors.primary,
                text: "Next",
                onPressed: () => controller.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeIn,
                ),
              ),
              12.h,
              CustomButton(
                color: AppColors.primary,
                backgroundColor: AppColors.sugarCoated,
                text: "Skip",
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
