import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

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
          SizedBox(
            height: 3,
            width: 38,
            child:ColoredBox(color:  AppColors.windChime,)
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: pageCount,
            effect: const WormEffect(
              dotWidth: 6,
              dotHeight: 6,
              activeDotColor: Colors.redAccent,
              dotColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  controller.jumpToPage(pageCount - 1);
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: const Text("Next", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
