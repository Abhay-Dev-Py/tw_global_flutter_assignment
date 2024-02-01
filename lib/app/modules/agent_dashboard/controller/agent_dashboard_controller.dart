import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';

class AgentDashboardProvider extends ChangeNotifier {
  AgentOnboardingStatus _agentStatus =
      AgentOnboardingStatus.verification_started;
  AgentOnboardingStatus get agentStatus => this._agentStatus;

  set agentStatus(AgentOnboardingStatus value) {
    this._agentStatus = value;
    notifyListeners();
  }
}
