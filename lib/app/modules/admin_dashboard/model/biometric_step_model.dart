import 'package:flutter_getx_template/app/common/constants.dart';

class BiometricStepModel {
  final BiometricSteps step;
  bool completionStatus;
  final String stepDescription;

  BiometricStepModel({
    required this.step,
    this.completionStatus = false,
    required this.stepDescription,
  });
}
