import 'package:flutter_getx_template/app/common/constants.dart';

class AgentVerificationStepModel {
  final String stepTitle;
  final String stepDescription;
  final bool isActive;
  final String stepNavigationRoute;
  final AgentVerificationFlowStep step;

  AgentVerificationStepModel({
    required this.stepTitle,
    required this.stepDescription,
    this.isActive = false,
    required this.stepNavigationRoute,
    required this.step,
  });
}
