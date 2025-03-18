import 'package:flutter/material.dart';
import '../../../data/models/onboarding_model.dart';
import 'widgets/onboarding_bottom_sheet.dart';
import '../../../utils/extensions/num_extension.dart';

class OnboardPage extends StatelessWidget {
  OnboardPage({super.key});

  final PageController _controller = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      if (_controller.page?.toInt() != _currentPageNotifier.value) {
        _currentPageNotifier.value = _controller.page?.toInt() ?? 0;
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingPages.length,
                itemBuilder: (context, index) {
                  final page = onboardingPages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        page.image,
                        height: 260,
                        width: 307,
                      ),
                      20.h,
                    ],
                  );
                },
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: _currentPageNotifier,
              builder: (context, currentPage, child) {
                final page = onboardingPages[currentPage];
                return OnboardingBottomSheet(
                  title: page.title,
                  description: page.description,
                  controller: _controller,
                  pageCount: onboardingPages.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
