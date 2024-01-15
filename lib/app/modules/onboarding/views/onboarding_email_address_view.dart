import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/login/view/local_widgets/role_switch_widget.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingEmailAddressView extends StatefulWidget {
  const OnboardingEmailAddressView({Key? key}) : super(key: key);

  @override
  State<OnboardingEmailAddressView> createState() =>
      _OnboardingEmailAddressViewState();
}

class _OnboardingEmailAddressViewState
    extends State<OnboardingEmailAddressView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Consumer<OnboardingProvider>(
        builder: (_, value, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              "Verify your email",
              style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              "Enter your email address",
              style: AppTextStyle.lightStyle.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextFieldWidget(
              labelText: "Enter email ID",
              controller: value.emailAddressController,
              onChanged: (updatedText) {
                value.setEmailAddressControllerValue = updatedText ?? "";
              },
              validator: (value) => AppValidators.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoleSwitchWidget(
                  role: "@gmail.com",
                  isSelected: false,
                  onPressed: (emailExtension) {
                    if (!value.emailAddressController.text.contains("@")) {
                      value.setEmailAddressControllerValue =
                          value.emailAddressController.text + emailExtension;
                    }
                  },
                  width: 100.w,
                  style: AppTextStyle.lightStyle.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 14.sp,
                  ),
                ),
                RoleSwitchWidget(
                  role: "@yahoo.com",
                  isSelected: false,
                  onPressed: (emailExtension) {
                    if (!value.emailAddressController.text.contains("@")) {
                      value.setEmailAddressControllerValue =
                          value.emailAddressController.text + emailExtension;
                    }
                  },
                  width: 100.w,
                  style: AppTextStyle.lightStyle.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 14.sp,
                  ),
                ),
                RoleSwitchWidget(
                  role: "@live.com",
                  isSelected: false,
                  onPressed: (emailExtension) {
                    if (!value.emailAddressController.text.contains("@")) {
                      value.setEmailAddressControllerValue =
                          value.emailAddressController.text + emailExtension;
                    }
                  },
                  width: 100.w,
                  style: AppTextStyle.lightStyle.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomTextButton(
              title: "verify email",
              onPressed: AppValidators.validateEmail(
                        value.emailAddressController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      value.currentStep = OnboardingSteps.verify_email_otp;
                      Get.toNamed(Routes.ONBOARDING_VERIFY_EMAIL_OTP);
                    },
            ),
          ],
        ),
      ),
    );
  }
}
