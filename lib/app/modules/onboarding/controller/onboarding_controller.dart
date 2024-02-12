import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/models/agent_onboarding_model.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/data/services/navigation_service.dart';
import 'package:flutter_getx_template/app/modules/onboarding/service/onboarding_services.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';

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
  e_sign,
  // review_details,
  schedule_offline_verification,
  all_set,
}

class OnboardingProvider extends ChangeNotifier {
  final OnboardingServices _service = OnboardingServices();
  AgentOnboardingModel onboardingModel = getOnboardingModel;
  OnboardingSteps _currentStep = OnboardingSteps.location_permission;
  bool _inAsyncCall = false;
  bool get inAsyncCall => this._inAsyncCall;

  set inAsyncCall(bool value) => this._inAsyncCall = value;

  OnboardingSteps get currentStep {
    notifyListeners();
    return this._currentStep;
  }

  set currentStep(OnboardingSteps value) {
    inAsyncCall = false;
    cacheAgentOnboardingDetails();
    this._currentStep = value;
    notifyListeners();
  }

  // Location Permission View Logics -- Start

  Future<bool> askLocationPermission() async {
    PermissionStatus locationPermissionStatus =
        await Permission.location.status;
    try {
      switch (locationPermissionStatus) {
        case PermissionStatus.denied:
          await Permission.location.request();
          return await askLocationPermission();

        case PermissionStatus.granted:
          return true;

        case PermissionStatus.restricted:
          return false;

        case PermissionStatus.limited:
          return false;

        case PermissionStatus.permanentlyDenied:
          Utils.showSnackbar(
            "Please enable location permission from app settings",
          );
          return false;

        case PermissionStatus.provisional:
          return false;
        default:
          return false;
      }
    } catch (_) {
      return false;
    }
  }

  // Location Permission View Logics -- end

  // --------------------------------------

  // Mobile Number View Logics -- Start
  final TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController get mobileNumberController =>
      this._mobileNumberController;

  set setMobileNumberController(String value) {
    this._mobileNumberController.text = value;
    onboardingModel.mobileNumber = value;
    notifyListeners();
  }

  final TextEditingController _mobileOTPController = TextEditingController();
  TextEditingController get mobileOTPController => this._mobileOTPController;

  set setMobileOTPControllerValue(String value) {
    this._mobileOTPController.text = value;
    notifyListeners();
  }

  bool _clearMobileOtp = false;
  bool get clearMobileOtp => this._clearMobileOtp;

  set clearMobileOtp(bool value) {
    this._clearMobileOtp = value;
    setMobileOTPControllerValue = "";
    notifyListeners();
  }

  Future<bool> sendMobileOtp() async {
    inAsyncCall = true;
    return await _service
        .sendMobileOtp(
          mobileNumber: "+91" + mobileNumberController.text,
        )
        .whenComplete(() => inAsyncCall = false);
  }

  Future<bool> verifyMobileOtp({bool isResendOtp = false}) async {
    inAsyncCall = true;
    return await _service
        .verifyMobileOtp(
          otp: mobileOTPController.text,
          isResendOtp: isResendOtp,
        )
        .whenComplete(() => inAsyncCall = false);
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

  late Timer _timer;
  int _secondsRemaining = 0;

  int get secondsRemaining => _secondsRemaining;

  String get formattedTime {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    _secondsRemaining = Constants.otpResendSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
  }

  void disposeTimer() {
    _timer.cancel();
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

  void signupSetPasscode(String number) {
    setConfirmPasscodeControllerValue = number;
  }

  // Passcode View Logics -- end

  // --------------------------------------

  // Biometric View Logics -- start

  Future<Either<bool, bool>> enableBiometrics() async {
    // check if device is compatible
    final LocalAuthentication auth = LocalAuthentication();

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if (canAuthenticate) {
      try {
        final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to enable biometrics',
        );
        return didAuthenticate ? const Right(true) : const Left(false);
      } catch (e) {
        return const Left(false);
      }
    }

    return const Left(false);
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

  bool _showPanNumber = true;
  bool get showPanNumber => this._showPanNumber;

  set showPanNumber(bool value) {
    this._showPanNumber = value;
    notifyListeners();
  }

  // PAN Details View Logics -- end

  // --------------------------------------

  // Shop Details View Logics -- start

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

  initiateShopDetails() {
    try {
      setCountryControllerValue = "India";
    } catch (_) {
      // do nothing
    }
  }

  // Shop Details View Logics -- end

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
    this._dateOfCertificateIssueController.text = Utils.formatDateString(value);
    notifyListeners();
  }

  String ibfCertificatePhotoAddress = "";
  get getIbfCertificatePhotoAddress => this.ibfCertificatePhotoAddress;

  set setIbfCertificatePhotoAddress(final ibfCertificatePhotoAddress) =>
      this.ibfCertificatePhotoAddress = ibfCertificatePhotoAddress;

  bool isTnCAccepted = false;
  bool get getIsTnCAccepted => this.isTnCAccepted;

  set setIsTnCAccepted(bool isTnCAccepted) {
    this.isTnCAccepted = isTnCAccepted;
    notifyListeners();
  }

  // IIBF Certificate Details View Logics -- end

  // --------------------------------------

  // Review all details View Logics -- Start

  bool _isPersonationDetailsEditable = true;
  bool _isShopDetailsEditable = true;
  bool _isCertificateDetailsEditable = true;

  bool get isPersonationDetailsEditable => this._isPersonationDetailsEditable;

  set isPersonationDetailsEditable(bool value) {
    this._isPersonationDetailsEditable = value;
    notifyListeners();
  }

  get isShopDetailsEditable => this._isShopDetailsEditable;

  set isShopDetailsEditable(value) {
    this._isShopDetailsEditable = value;
    notifyListeners();
  }

  get isCertificateDetailsEditable => this._isCertificateDetailsEditable;

  set isCertificateDetailsEditable(value) {
    this._isCertificateDetailsEditable = value;
    notifyListeners();
  }

  setOnboardingDetails(ReviewDetails detail, dynamic value) {
    switch (detail) {
      case ReviewDetails.full_name:
        setFullNameControllerValue = value;
        onboardingModel.panDetails.fullName = value;
        break;
      case ReviewDetails.dob:
        onboardingModel.panDetails.dateOfBirth = value;
        break;
      case ReviewDetails.email:
        onboardingModel.emailAddress = value;
        break;
      case ReviewDetails.mobile_number:
        onboardingModel.mobileNumber = value;
        break;
      case ReviewDetails.pan_number:
        onboardingModel.panDetails.panNumber = value;
        break;
      case ReviewDetails.shop_name:
        onboardingModel.shopDetails.shopName = value;
        break;
      case ReviewDetails.shop_address:
        onboardingModel.shopDetails.shopAddress = value;
        break;
      case ReviewDetails.city:
        onboardingModel.shopDetails.city = value;
        break;
      case ReviewDetails.state:
        onboardingModel.shopDetails.state = value;
        break;
      case ReviewDetails.country:
        onboardingModel.shopDetails.country = value;
        break;
      case ReviewDetails.pincode:
        onboardingModel.shopDetails.pincode = value;
        break;
      case ReviewDetails.iibf_registration_number:
        onboardingModel.iibfCertificateDetails.registrationNumber = value;
        break;
      case ReviewDetails.serial_number:
        onboardingModel.iibfCertificateDetails.serialNumber = value;
        break;
      case ReviewDetails.date_of_certificate_issue:
        onboardingModel.iibfCertificateDetails.dateOfCertificateIssue = value;
        break;
      case ReviewDetails.iibf_certificate_photo:
        onboardingModel.iibfCertificateDetails.certificatePhotoFilePath = value;
        break;
    }
  }
  

  // Review all details View Logics -- End

  // --------------------------------------

  // Schedule Offline Verification View Logics -- Start

  final List<Map<String, String>> _dateList = [];
  get getDateList => _dateList;

  set setDateList(value) {
    _dateList.addAll(value);
    notifyListeners();
  }

  final List<String> _timeList = [];
  get getTimeList => _timeList;

  set setTimeList(value) {
    _timeList.addAll(value);
    notifyListeners();
  }

  int _selectedDayIndex = 0;
  int get getSelectedDayIndex => this._selectedDayIndex;

  set setSelectedDayIndex(int selectedDayIndex) {
    this._selectedDayIndex = selectedDayIndex;
    notifyListeners();
  }

  int _selectedTimeIndex = 0;
  int get getSelectedTimeIndex => this._selectedTimeIndex;

  set setSelectedTimeIndex(int selectedTimeIndex) {
    this._selectedTimeIndex = selectedTimeIndex;
    notifyListeners();
  }

  void generateDateList() {
    // Get the current date
    DateTime currentDate = DateTime.now();

    DateFormat dateFormat = DateFormat('EEEE');
    DateFormat dayFormat = DateFormat('d MMM');

    setDateList = [
      {
        'day': 'Today',
        'date': dayFormat.format(currentDate),
      }
    ];

    for (int i = 1; i <= 6; i++) {
      DateTime nextDate = currentDate.add(Duration(days: i));

      setDateList = [
        {
          'day': i == 1 ? 'Tomorrow' : dateFormat.format(nextDate),
          'date': dayFormat.format(nextDate),
        }
      ];
    }
  }

  void generateTimeSlots() {
    DateTime startTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      10,
      0,
    );
    DateTime endTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      17,
      30,
    );

    while (startTime.isBefore(endTime)) {
      setTimeList = [
        TimeOfDay.fromDateTime(startTime)
            .format(AppNavigation.navigatorKey.currentState!.context),
      ];

      startTime = startTime.add(const Duration(minutes: 30));
    }
  }

  // Schedule Offline Verification View Logics -- End

  // --------------------------------------

  // cache onboarding details
  cacheAgentOnboardingDetails() {
    switch (currentStep) {
      case OnboardingSteps.location_permission:
        break;
      case OnboardingSteps.enter_mobile_number:
        onboardingModel.mobileNumber = mobileNumberController.text;
        break;
      case OnboardingSteps.verify_mobile_otp:
        break;
      case OnboardingSteps.enter_email_address:
        onboardingModel.emailAddress = emailAddressController.text;
        break;
      case OnboardingSteps.verify_email_otp:
        break;
      case OnboardingSteps.set_passcode:
        break;
      case OnboardingSteps.confirm_passcode:
        break;
      case OnboardingSteps.enable_biometric:
        break;
      case OnboardingSteps.enter_pan_details:
        onboardingModel.panDetails.dateOfBirth = dobController.text;
        onboardingModel.panDetails.fullName = fullNameController.text;
        onboardingModel.panDetails.panNumber = panNumberController.text;
        break;
      case OnboardingSteps.enter_shop_details:
        onboardingModel.shopDetails.shopName = shopNameController.text;
        onboardingModel.shopDetails.shopAddress = shopAddressController.text;
        onboardingModel.shopDetails.city = cityController.text;
        onboardingModel.shopDetails.state = stateController.text;
        onboardingModel.shopDetails.country = countryController.text;
        onboardingModel.shopDetails.pincode = pincodeController.text;
        break;
      case OnboardingSteps.enter_certificate_details:
        onboardingModel.iibfCertificateDetails.registrationNumber =
            registrationNumberController.text;
        onboardingModel.iibfCertificateDetails.serialNumber =
            serialNumberController.text;
        onboardingModel.iibfCertificateDetails.dateOfCertificateIssue =
            dateOfCertificateIssueController.text;
        onboardingModel.iibfCertificateDetails.certificatePhotoFilePath =
            getIbfCertificatePhotoAddress;
        break;
      case OnboardingSteps.e_sign:
        break;
      case OnboardingSteps.schedule_offline_verification:
        break;
      case OnboardingSteps.all_set:
        break;
    }
  }
}
