import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/utils.dart';
import 'package:flutter_getx_template/app/data/services/navigation_service.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AppLandingProvider extends ChangeNotifier {
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
    if (role == Role.admin && Platform.isIOS) {
      Utils.showSnackbar(
        "Unfortunately you can't continue your journey in iOS App",
      );
      return;
    }
    Get.toNamed(Routes.SIGN_IN_MOBILE, arguments: role);
  }

  void onGetStarted({required Role role, bool isFromSignIn = false}) async {
    // if location is granted, skip locations page
    PermissionStatus locationPermissionStatus =
        await Permission.location.status;
    if (locationPermissionStatus == PermissionStatus.granted) {
      Provider.of<OnboardingProvider>(
        AppNavigation.navigatorKey.currentState!.context,
        listen: false,
      ).currentStep = OnboardingSteps.enter_mobile_number;
      isFromSignIn
          ? Get.offAndToNamed(Routes.ONBOARDING_MOBILE_NUMBER)
          : Get.toNamed(Routes.ONBOARDING_MOBILE_NUMBER);
    } else {
      Get.toNamed(Routes.ONBOARDING_LOCATION);
    }
    // AppNavigation.goNamed(Routes.ONBOARDING_LOCATION);
  }
}
