import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repeeefy/src/content/constants/constants.dart';
import 'package:repeeefy/src/features/onboarding_getx/controllers/onboarding_controller.dart';
import 'package:repeeefy/src/shared/components/components.dart';

class OnboardingViewX extends StatelessWidget {
  final _pageController = PageController(initialPage: 0);
  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.ease;
  final onboardingController = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          var onboardingPages = onboardingController.onboardingPages;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Spacing.height(24),
                Align(
                  alignment: Alignment.centerRight,
                  child: onboardingController.selectedPageIndex.value == 2
                      ? AppFlatButton.empty()
                      : AppFlatButton(
                          label: 'Skip',
                          onPressed: () => Get.toNamed('/login-view'),
                        ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingPages.length,
                    itemBuilder: (context, index) {
                      return OnboardingItem(
                        imageUrl: onboardingPages[index].imageUrl,
                        title: onboardingPages[index].title,
                        description: onboardingPages[index].description,
                      );
                    },
                    physics: BouncingScrollPhysics(),
                    onPageChanged: onboardingController.selectedPageIndex,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingPages.length,
                    (index) => AnimatedContainer(
                      duration: 150.milliseconds,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: onboardingController.selectedPageIndex.value ==
                                index
                            ? AppColors.darkPrimaryColor
                            : AppColors.darkSurfaceColor,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
                Spacing.height(32),
                onboardingController.selectedPageIndex.value == 2
                    ? AppRaisedButton(
                        label: 'Get Started',
                        onPressed: () => Get.toNamed('/login-view'))
                    : AppRaisedButton(
                        label: 'Continue',
                        onPressed: () => _pageController.nextPage(
                            duration: _duration, curve: _curve),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
