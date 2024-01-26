import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignInProvider extends ChangeNotifier {
  bool _isBiometricAllowed = false;
  bool get isBiometricAllowed => this._isBiometricAllowed;

  set isBiometricAllowed(bool value) => this._isBiometricAllowed = value;

  final TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController get mobileNumberController => _mobileNumberController;

  set setMobileNumberController(String value) {
    _mobileNumberController.text = value;
    notifyListeners();
  }

  // get this from backend
  int _passcodeRetryMinutes = 15;
  int get passcodeRetryMinutes => this._passcodeRetryMinutes;

  set passcodeRetryMinutes(int value) {
    this._passcodeRetryMinutes = value;
    notifyListeners();
  }

  int _passcodeAttempts = 4;
  int get passcodeAttempts => _passcodeAttempts;

  String? errorMsg;
  String _attemptsRemaining = '';
  String get attemptsRemaining => this._attemptsRemaining;

  set attemptsRemaining(String value) {
    this._attemptsRemaining = value;
    notifyListeners();
  }

  set passcodeAttempts(final value) {
    _passcodeAttempts = value;
    if (_passcodeAttempts > 0) {
      errorMsg = "Wrong passcode.";
      attemptsRemaining = "$_passcodeAttempts attempts remaining.";
    } else if (_passcodeAttempts == 0) {
      errorMsg = "Passcode limit reached.";
      attemptsRemaining = "Try after $passcodeRetryMinutes minutes";
      // invoke timer
      _invokeTimer();
    }
    notifyListeners();
  }

  void _invokeTimer() {
    int timeout = passcodeRetryMinutes;
    Future.delayed(Duration(seconds: timeout)).then((value) {
      passcodeRetryMinutes--;
      attemptsRemaining = "Try after $passcodeRetryMinutes minutes";
      notifyListeners();
    });
  }

  void initializePasscodeVerify() async {
    if (isBiometricAllowed) {
      await useBiometrics();
    }
  }

  Future<void> useBiometrics() async {
    // if (isBiometricAllowed) {
    //   // ask for auth and proceed to dashboard if ok
    //   await OnboardingProvider().enableBiometrics().thenRight((right) async {
    //     Get.offAndToNamed(Routes.AGENT_DASHBOARD);
    //     throw ("");
    //   }).thenLeft((left) => throw (""));
    // }
    await OnboardingProvider().enableBiometrics().thenRight((right) async {
      Get.offAndToNamed(Routes.AGENT_DASHBOARD);
      throw ("");
    }).thenLeft((left) => throw (""));
  }
}
