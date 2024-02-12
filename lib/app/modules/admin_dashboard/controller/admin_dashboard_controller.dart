import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/models/agent_details_verification_model.dart';
import 'package:flutter_getx_template/app/common/util/utils.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/agent_request_model.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/agent_verification_step_model.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/pan_error_model.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';

class AdminDashboardProvider extends ChangeNotifier {
  AdminSelectedTab _selectedTab = AdminSelectedTab.in_progress;
  AdminSelectedTab get selectedTab => this._selectedTab;
  AgentDetailsVerificationModel verificationModel = getVerificationModel;

  set selectedTab(AdminSelectedTab value) {
    this._selectedTab = value;
    notifyListeners();
  }

  int _selectedAgentRequest = 0;
  int get selectedAgentRequest => this._selectedAgentRequest;

  set selectedAgentRequest(int value) {
    this._selectedAgentRequest = value;
    notifyListeners();
  }

  List<AgentRequestModel> agentRequests = [
    AgentRequestModel(
      name: "Pradyut Meher",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
      adminVerificationStatus: AdminSelectedTab.pending,
    ),
    AgentRequestModel(
      name: "Abhay Rajput",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
      adminVerificationStatus: AdminSelectedTab.pending,
      agentVerificationStatus: AgentVerificationStatus.start_verification,
    ),
    AgentRequestModel(
      name: "Komal Singhania",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
      adminVerificationStatus: AdminSelectedTab.in_progress,
    ),
    AgentRequestModel(
      name: "Amit Kumar",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
      adminVerificationStatus: AdminSelectedTab.in_progress,
    ),
    AgentRequestModel(
      name: "Manik AR",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
      adminVerificationStatus: AdminSelectedTab.verififed,
    ),
  ];

  final TextEditingController _rejectReasonController = TextEditingController();
  TextEditingController get rejectReasonController =>
      this._rejectReasonController;

  set setRejectReasonControllerValue(String value) {
    this._rejectReasonController.text = value;
    notifyListeners();
  }

  final TextEditingController _agentOtpController = TextEditingController();
  TextEditingController get agentOtpController => this._agentOtpController;

  set setAgentOtpControllerValue(String value) {
    this._agentOtpController.text = value;
    notifyListeners();
  }

  List<AgentVerificationStepModel> agentVerificationSteps = [
    AgentVerificationStepModel(
      isActive: true,
      stepTitle: "PAN verification",
      stepDescription: "Upload PAN of agent to verify",
      stepNavigationRoute: Routes.PAN_UPLOAD_VIEW,
      step: AgentVerificationFlowStep.pan_verification,
    ),
    AgentVerificationStepModel(
      stepTitle: "Details Confirmation",
      stepDescription: "Confirm agent details",
      stepNavigationRoute: Routes.LANDING,
      step: AgentVerificationFlowStep.details_confirmation,
    ),
    AgentVerificationStepModel(
      stepTitle: "Shop verification",
      stepDescription: "Upload photo of shop to verify",
      stepNavigationRoute: Routes.LANDING,
      step: AgentVerificationFlowStep.shop_verification,
    ),
    AgentVerificationStepModel(
      stepTitle: "Selfie verification",
      stepDescription: "Upload a selfie of agent to verify",
      stepNavigationRoute: Routes.LANDING,
      step: AgentVerificationFlowStep.selfie_verification,
    ),
    AgentVerificationStepModel(
      stepTitle: "Mobile Verification",
      stepDescription: "Enter OTP to verify",
      stepNavigationRoute: Routes.LANDING,
      step: AgentVerificationFlowStep.mobile_verification,
    ),
    AgentVerificationStepModel(
      stepTitle: "Biometric",
      stepDescription: "Submit a thumb impression",
      stepNavigationRoute: Routes.LANDING,
      step: AgentVerificationFlowStep.biometric,
    ),
  ];

  // PAN Verification Logic -- Start

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

  final TextEditingController _fatherNameController = TextEditingController();
  TextEditingController get fatherNameController => this._fatherNameController;

  set setFatherNameControllerValue(String value) {
    this._fatherNameController.text = value;
    notifyListeners();
  }

  bool _showPanNumber = true;
  bool get showPanNumber => this._showPanNumber;

  set showPanNumber(bool value) {
    this._showPanNumber = value;
    notifyListeners();
  }

  bool _isPanSubmitTermAccepted = false;
  bool get getIsPanSubmitTerm => this._isPanSubmitTermAccepted;

  set setIsPanSubmitTermAccepted(bool value) {
    this._isPanSubmitTermAccepted = value;
    notifyListeners();
  }

  List<PanErrorModel> errorCodes = List.generate(
    PanErrorCodes.values.length,
    (index) => generatePanErrorModel(PanErrorCodes.values[index]),
  );

  getPanErrorModel(PanErrorCodes errorCode) => generatePanErrorModel(errorCode);

  // PAN Verification Logic -- End

  // -------------------------------------------------

  // Details Confirmation Logic -- Start

  bool _isAgentDetailsEditable = true;
  bool _isShopDetailsEditable = true;

  bool get isAgentDetailsEditable => this._isAgentDetailsEditable;

  set isAgentDetailsEditable(bool value) {
    this._isAgentDetailsEditable = value;
    notifyListeners();
  }

  get isShopDetailsEditable => this._isShopDetailsEditable;

  set isShopDetailsEditable(value) {
    this._isShopDetailsEditable = value;
    notifyListeners();
  }

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


  final TextEditingController _dobController = TextEditingController();
  TextEditingController get dobController => this._dobController;

  set setDobControllerValue(final value) {
    this._dobController.text = Utils.formatDateString(value);
    notifyListeners();
  }


  setVerificationDetails(ReviewAgentDetails detail, dynamic value) {
    switch (detail) {
      case ReviewAgentDetails.full_name:
        setFullNameControllerValue = value;
        verificationModel.panDetails.fullName = value;
        break;
      case ReviewAgentDetails.dob:
        verificationModel.panDetails.dateOfBirth = value;
        break;
      case ReviewAgentDetails.email:
        verificationModel.emailAddress = value;
        break;
      case ReviewAgentDetails.mobile_number:
        verificationModel.mobileNumber = value;
        break;
      case ReviewAgentDetails.pan_number:
        verificationModel.panDetails.panNumber = value;
        break;
      case ReviewAgentDetails.shop_name:
        verificationModel.shopDetails.shopName = value;
        break;
      case ReviewAgentDetails.shop_address:
        verificationModel.shopDetails.shopAddress = value;
        break;
      case ReviewAgentDetails.city:
        verificationModel.shopDetails.city = value;
        break;
      case ReviewAgentDetails.state:
        verificationModel.shopDetails.state = value;
        break;
      case ReviewAgentDetails.country:
        verificationModel.shopDetails.country = value;
        break;
      case ReviewAgentDetails.pincode:
        verificationModel.shopDetails.pincode = value;
        break;
    }
  }



  // Details Confirmation Logic -- End

  // -------------------------------------------------

  notifyAll() {
    notifyListeners();
  }
}
