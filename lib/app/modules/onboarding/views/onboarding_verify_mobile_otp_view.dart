import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
  void initState() {
    Provider.of<OnboardingProvider>(context, listen: false).startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, value, __) {
        return AppScaffold(
          inAsyncCall: value.inAsyncCall,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Confirm OTP",
                style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                "Enter the OTP sent to +91 ${value.mobileNumberController.text}",
                style: AppTextStyle.lightStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.h),
              OtpTextField(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                numberOfFields: 6,
                clearText: value.clearMobileOtp,
                enabledBorderColor: AppColors.lightBlue,
                disabledBorderColor: AppColors.black,
                borderWidth: 1.w,
                showFieldAsBox: true,
                borderRadius: BorderRadius.circular(4.r),
                fieldWidth: 44.w,
                hasCustomInputDecoration: true,
                decoration: InputDecoration(
                  hintText: "-",
                  counterText: "",
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      width: 4.r,
                      color: AppColors.lightBlue,
                    ),
                  ),
                ),
                onCodeChanged: (String otp) {
                  // value.setMobileOTPControllerValue = otp;
                },
                onSubmit: (String verificationCode) {
                  value.setMobileOTPControllerValue = verificationCode;
                },
              ),
              SizedBox(height: 20.h),
              Text.rich(
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
                          ? "resend"
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
                            value.verifyMobileOtp(isResendOtp: true);
                            // value.clearMobileOtp = true;
                            value.startTimer();
                          }
                        },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomTextButton(
                title: "confirm",
                onPressed:
                    AppValidators.validateOTP(value.mobileOTPController.text) !=
                            null
                        ? null
                        : () async {
                            if (await value.verifyMobileOtp()) {
                              value.disposeTimer();
                              value.currentStep =
                                  OnboardingSteps.enter_email_address;
                              Get.toNamed(Routes.ONBOARDING_EMAIL_ADDRESS);
                            }
                          },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    Provider.of<OnboardingProvider>(context, listen: false).disposeTimer();
    super.dispose();
  }
}