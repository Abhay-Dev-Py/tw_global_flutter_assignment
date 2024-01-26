import 'package:flutter_getx_template/app/modules/landing/localization/landing_localization.dart';
import 'package:flutter_getx_template/app/modules/onboarding/localization/onboarding_localization.dart';
import 'package:get/get.dart';

enum Languages { english, hindi }

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          ...AppLandingLocalization.en,
          ...OnboardingLocalization.en,
        },
        'hi_IN': {
          ...AppLandingLocalization.hi,
          ...OnboardingLocalization.hi,
        },
      };
}
