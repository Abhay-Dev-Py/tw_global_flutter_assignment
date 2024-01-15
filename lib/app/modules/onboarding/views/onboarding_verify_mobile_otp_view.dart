import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingVerifyMobileOtpView extends StatefulWidget {
  const OnboardingVerifyMobileOtpView({Key? key}) : super(key: key);

  @override
  State<OnboardingVerifyMobileOtpView> createState() =>
      _OnboardingVerifyMobileOtpViewState();
}

class _OnboardingVerifyMobileOtpViewState
    extends State<OnboardingVerifyMobileOtpView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            "Confirm OTP",
            style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
          ),
          SizedBox(height: 8.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, _) {
              return Text(
                "Enter the OTP sent to +91 ${value.mobileNumberController.text}",
                style: AppTextStyle.lightStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, _) {
              return CustomTextFieldWidget(
                labelText: "6 digit OTP",
                controller: value.mobileOTPController,
                onChanged: (updatedText) {
                  value.setMobileOTPControllerValue = updatedText ?? "";
                },
                validator: (value) => AppValidators.validateOTP(value),
                keyboardType: TextInputType.phone,
                maxLength: 6,
              );
            },
          ),
          const Spacer(),
          Consumer<OnboardingProvider>(
            builder: (_, value, __) => CustomTextButton(
              title: "confirm",
              onPressed:
                  AppValidators.validateOTP(value.mobileOTPController.text) !=
                          null
                      ? null
                      : () {
                          if (value.mobileOTPController.text == "457774") {
                            value.currentStep =
                                OnboardingSteps.enter_email_address;
                            Get.toNamed(Routes.ONBOARDING_EMAIL_ADDRESS);
                          } else {
                            Utils.showSnackbar("Invalid OTP");
                          }
                        },
            ),
          ),
        ],
      ),
    );
  }
}
