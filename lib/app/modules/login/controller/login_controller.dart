import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  Role role = Role.agent;
  get getIsLoading => this.isLoading;

  set setIsLoading(isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  get getRole => this.role;

  set setRole(role) {
    this.role = role;
    notifyListeners();
  }

  void onSignIn(Role role) {
    // Get.toNamed(Routes.ONBOARDING_LOCATION);
  }

  void onGetStarted(Role role) {
    Get.toNamed(Routes.ONBOARDING_LOCATION);
    // AppNavigation.goNamed(Routes.ONBOARDING_LOCATION);
  }
}
