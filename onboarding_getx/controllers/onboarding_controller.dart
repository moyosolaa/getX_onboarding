import 'package:get/get.dart';
import 'package:repeeefy/src/content/constants/constants.dart';
import 'package:repeeefy/src/features/onboarding_getx/models/unboarding_model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      imageUrl: AppImages.onboarding1,
      title: AppStrings.onboardingTitle1.toUpperCase(),
      description: AppStrings.onboardingDesc1,
    ),
    OnboardingModel(
      imageUrl: AppImages.onboarding2,
      title: AppStrings.onboardingTitle2.toUpperCase(),
      description: AppStrings.onboardingDesc2,
    ),
    OnboardingModel(
      imageUrl: AppImages.onboarding3,
      title: AppStrings.onboardingTitle3.toUpperCase(),
      description: AppStrings.onboardingDesc3,
    ),
  ];
}
