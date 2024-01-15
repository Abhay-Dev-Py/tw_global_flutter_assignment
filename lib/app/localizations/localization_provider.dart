import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/login/localization/login_localization.dart';
import 'package:flutter_getx_template/app/modules/onboarding/localization/onboarding_localization.dart';

enum Languages { english, hindi }

class LocalizationProvider extends ChangeNotifier {
  Languages _currentLanguage = Languages.english;
  get getCurrentLanguage => _currentLanguage;

  set setCurrentLanguage(currentLanguage) {
    _currentLanguage = currentLanguage;
    notifyListeners();
  }

  static Map<String, String> masterLangDataEnglish = {}
    ..addAll(LoginLocalization.en)
    ..addAll(OnboardingLocalization.en);

  static Map<String, String> masterLangDataHindi = {}
    ..addAll(LoginLocalization.hi)
    ..addAll(OnboardingLocalization.hi);

  String translateLanguage(String key) {
    if (getCurrentLanguage == Languages.english) {
      notifyListeners();
      return masterLangDataEnglish[key] ?? "English String not found";
    } else {
      notifyListeners();
      return masterLangDataHindi[key] ?? "Hindi String not found";
    }
  }
}

extension StringExtension on String {
  String get trs {
    // fetch current language preference
    return LocalizationProvider().translateLanguage(this);
  }
}
