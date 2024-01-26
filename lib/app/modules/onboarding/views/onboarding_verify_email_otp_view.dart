import 'package:flutter/gestures.dart';
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

class OnboardingVerifyEmailOtpView extends StatefulWidget {
  const OnboardingVerifyEmailOtpView({Key? key}) : super(key: key);

  @override
  State<OnboardingVerifyEmailOtpView> createState() =>
      _OnboardingVerifyEmailOtpViewState();
}

class _OnboardingVerifyEmailOtpViewState
    extends State<OnboardingVerifyEmailOtpView> {
  @override
  void initState() {
    Provider.of<OnboardingProvider>(context, listen: false).startTimer();
    super.initState();
  }

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
                "Enter the OTP sent to ${value.emailAddressController.text}",
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
                controller: value.emailOTPController,
                onChanged: (updatedText) {
                  value.setEmailOTPControllerValue = updatedText ?? "";
                },
                validator: (value) => AppValidators.validateOTP(value),
                keyboardType: TextInputType.phone,
                maxLength: 6,
              );
            },
          ),
          SizedBox(height: 20.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, __) {
              return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: value.formattedTime == "0:00"
                          ? "Didn't receive OTP "
                          : "Resend OTP in ",
                      style: AppTextStyle.lightStyle.copyWith(
                        fontWeight: FontWeight.w200,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: value.formattedTime == "0:00"
                          ? "now"
                          : value.formattedTime,
                      style: AppTextStyle.lightStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (value.formattedTime == "0:00") {
                            // call the resend api here and start the timer again
                            value.startTimer();
                          }
                        },
                    ),
                  ],
                ),
              );
            },
          ),
          const Spacer(),
          Consumer<OnboardingProvider>(
            builder: (_, value, __) => CustomTextButton(
              title: "confirm",
              onPressed:
                  AppValidators.validateOTP(value.emailOTPController.text) !=
                          null
                      ? null
                      : () {
                          if (value.emailOTPController.text == "457774") {
                            value.disposeTimer();
                            value.currentStep = OnboardingSteps.set_passcode;
                            Get.toNamed(Routes.ONBOARDING_SET_PASSCODE);
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

  @override
  void dispose() {
    Provider.of<OnboardingProvider>(context, listen: false).disposeTimer();
    super.dispose();
  }
}
