import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/modules/onboarding/localization/onboarding_localization.dart';
import 'package:get/utils.dart';

import '../../../../common/util/exports.dart';
import '../../../widgets/custom_text_button.dart';

class AgentInfoWidget extends StatelessWidget {
  final Function onGetStarted;
  final Function onSignIn;
  const AgentInfoWidget({
    Key? key,
    required this.onGetStarted,
    required this.onSignIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Become Our\nKYC Agent",
          style: TextStyle(
            color: AppColors.indigo,
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          OnboardingStrings.startOfferingAppreciate.tr,
          style: TextStyle(
            color: AppColors.hintInfotextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20.h),
        CustomTextButton(
          title: "get started",
          onPressed: () => onGetStarted(Role.agent),
        ),
        SizedBox(height: 22.h),
        Align(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Have an account? ",
                  style: TextStyle(
                    color: AppColors.hintInfotextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "sign in",
                  style: AppTextStyle.regularStyle.copyWith(
                    color: AppColors.blue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => onSignIn(Role.agent),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
