import 'package:flutter_getx_template/app/common/constants.dart';

class AgentRequestModel {
  String? name;
  String? address;
  String? number;
  String? agentVerificationStatus;
  AdminSelectedTab adminVerificationStatus;

  AgentRequestModel({
    this.name,
    this.address,
    this.number,
    this.agentVerificationStatus,
    this.adminVerificationStatus = AdminSelectedTab.pending,
  });

  // AgentRequestModel.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   address = json['address'];
  //   number = json['number'];
  //   agentVerificationStatus = json['agent_verification_status'];
  //   adminVerificationStatus = json['admin_verification_status'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['number'] = number;
    data['agent_verification_status'] = agentVerificationStatus;
    data['admin_verification_status'] = adminVerificationStatus;
    return data;
  }
}
