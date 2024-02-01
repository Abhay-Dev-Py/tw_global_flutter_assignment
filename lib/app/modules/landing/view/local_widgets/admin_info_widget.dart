import 'package:flutter/material.dart';

import '../../../../common/constants.dart';
import '../../../../common/util/exports.dart';
import '../../../widgets/custom_text_button.dart';

class AdminInfoWidget extends StatelessWidget {
  final Function onSignIn;
  const AdminInfoWidget({
    Key? key,
    required this.onSignIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 46.h),
        Text(
          "Welcome back",
          style: TextStyle(
            color: AppColors.indigo,
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          "Sign in to start Agent Verification",
          style: TextStyle(
            color: AppColors.hintInfotextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20.h),
        CustomTextButton(
          title: "sign in",
          onPressed: () => onSignIn(Role.admin),
        ),
        SizedBox(height: 22.h),
      ],
    );
  }
}
