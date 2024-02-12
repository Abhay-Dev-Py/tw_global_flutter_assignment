import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/agent_request_model.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/agent_verification_step_model.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/pan_error_model.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';

class AdminDashboardProvider extends ChangeNotifier {
  AdminSelectedTab _selectedTab = AdminSelectedTab.in_progress;
  AdminSelectedTab get selectedTab => this._selectedTab;

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

  notifyAll() {
    notifyListeners();
  }
}
