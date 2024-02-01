import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/agent_request_model.dart';

class AdminDashboardProvider extends ChangeNotifier {
  AdminSelectedTab _selectedTab = AdminSelectedTab.in_progress;
  AdminSelectedTab get selectedTab => this._selectedTab;

  set selectedTab(AdminSelectedTab value) {
    this._selectedTab = value;
    notifyListeners();
  }

  List<AgentRequestModel> agentRequests = [
    AgentRequestModel(
      name: "Pradyut Meher",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
    ),
    AgentRequestModel(
      name: "Abhay Rajput",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
    ),
    AgentRequestModel(
      name: "Komal Singhania",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
    ),
    AgentRequestModel(
      name: "Amit Kumar",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
    ),
    AgentRequestModel(
      name: "Manik AR",
      address: 'KYC Point, HSR Layout, Bangalore',
      number: "7016131818",
    ),
  ];
}
