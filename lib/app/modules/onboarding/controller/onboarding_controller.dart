import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';

enum OnboardingSteps {
  location_permission,
  enter_mobile_number,
  verify_mobile_otp,
  enter_email_address,
  verify_email_otp,
  set_passcode,
  confirm_passcode,
  enable_biometric,
  enter_pan_details,
  enter_shop_details,
  enter_certificate_details,
  review_details,
  schedule_offline_verification,
  all_set,
}

class OnboardingProvider extends ChangeNotifier {
  OnboardingSteps _currentStep = OnboardingSteps.location_permission;

  OnboardingSteps get currentStep => this._currentStep;

  set currentStep(OnboardingSteps value) {
    this._currentStep = value;
    notifyListeners();
  }

  // Mobile Number View Logics -- Start
  final TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController get mobileNumberController =>
      this._mobileNumberController;

  set setMobileNumberController(String value) {
    this._mobileNumberController.text = value;
    notifyListeners();
  }

  final TextEditingController _mobileOTPController = TextEditingController();
  TextEditingController get mobileOTPController => this._mobileOTPController;

  set setMobileOTPControllerValue(String value) {
    this._mobileOTPController.text = value;
    notifyListeners();
  }

  // Mobile Number View Logics -- End

  // --------------------------------------

  // Email Address View Logics -- Start

  final TextEditingController _emailAddressController = TextEditingController();
  TextEditingController get emailAddressController =>
      this._emailAddressController;

  set setEmailAddressControllerValue(String value) {
    this._emailAddressController.text = value;
    notifyListeners();
  }

  final TextEditingController _emailOTPController = TextEditingController();
  TextEditingController get emailOTPController => this._emailOTPController;

  set setEmailOTPControllerValue(String value) {
    this._emailOTPController.text = value;
    notifyListeners();
  }

  // Email Address View Logics -- End

  // --------------------------------------

  // Passcode View Logics -- start

  final TextEditingController _passcodeController = TextEditingController();
  TextEditingController get passcodeController => this._passcodeController;

  set setPasscodeControllerValue(String value) {
    this._passcodeController.text = value;
    notifyListeners();
  }

  final TextEditingController _confirmPasscodeController =
      TextEditingController();
  TextEditingController get confirmPasscodeController =>
      this._confirmPasscodeController;

  set setConfirmPasscodeControllerValue(String value) {
    this._confirmPasscodeController.text = value;
    notifyListeners();
  }

  // Passcode View Logics -- end

  // --------------------------------------

  // PAN Details View Logics -- start

  final TextEditingController _panNumberController = TextEditingController();
  TextEditingController get panNumberController => this._panNumberController;

  set setPanNumberControllerValue(String value) {
    this._panNumberController.text = value;
    notifyListeners();
  }

  final TextEditingController _fullNameController = TextEditingController();
  TextEditingController get fullNameController => this._fullNameController;

  set setFullNameControllerValue(String value) {
    this._fullNameController.text = value;
    notifyListeners();
  }

  final TextEditingController _dobController = TextEditingController();
  TextEditingController get dobController => this._dobController;

  set setDobControllerValue(final value) {
    this._dobController.text = Utils.formatDateString(value);
    notifyListeners();
  }

  // PAN Details View Logics -- end

  // --------------------------------------

  // PAN Details View Logics -- start

  final TextEditingController _shopNameController = TextEditingController();
  TextEditingController get shopNameController => this._shopNameController;

  set setShopNameControllerValue(String value) {
    this._shopNameController.text = value;
    notifyListeners();
  }

  final TextEditingController _shopAddressController = TextEditingController();
  TextEditingController get shopAddressController =>
      this._shopAddressController;

  set setShopAddressControllerValue(String value) {
    this._shopAddressController.text = value;
    notifyListeners();
  }

  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  get cityController => this._cityController;

  set setCityControllerValue(String value) {
    this._cityController.text = value;
    notifyListeners();
  }

  get stateController => this._stateController;

  set setStateControllerValue(value) {
    this._stateController.text = value;
    notifyListeners();
  }

  get countryController => this._countryController;

  set setCountryControllerValue(value) {
    this._countryController.text = value;
    notifyListeners();
  }

  get pincodeController => this._pincodeController;

  set setPincodeControllerValue(value) {
    this._pincodeController.text = value;
    notifyListeners();
  }

  // PAN Details View Logics -- end

  // --------------------------------------

  // IIBF Certificate Details View Logics -- start

  final TextEditingController _registrationNumberController =
      TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();
  final TextEditingController _dateOfCertificateIssueController =
      TextEditingController();

  get registrationNumberController => this._registrationNumberController;

  set setRegistrationNumberControllerValue(String value) {
    this._registrationNumberController.text = value;
    notifyListeners();
  }

  get serialNumberController => this._serialNumberController;

  set setSerialNumberController(String value) {
    this._serialNumberController.text = value;
    notifyListeners();
  }

  get dateOfCertificateIssueController =>
      this._dateOfCertificateIssueController;

  set setDateOfCertificateIssueControllerValue(String value) {
    this._dateOfCertificateIssueController.text = value;
    notifyListeners();
  }

  String ibfCertificatePhotoAddress = "";
  get getIbfCertificatePhotoAddress => this.ibfCertificatePhotoAddress;

  set setIbfCertificatePhotoAddress(final ibfCertificatePhotoAddress) =>
      this.ibfCertificatePhotoAddress = ibfCertificatePhotoAddress;

  bool isTnCAccepted = false;
 bool get getIsTnCAccepted => this.isTnCAccepted;

 set setIsTnCAccepted(bool isTnCAccepted) => this.isTnCAccepted = isTnCAccepted;

  // IIBF Certificate Details View Logics -- end
}
