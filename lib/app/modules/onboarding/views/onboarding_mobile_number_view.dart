import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingMobileNumberView extends StatefulWidget {
  const OnboardingMobileNumberView({Key? key}) : super(key: key);

  @override
  State<OnboardingMobileNumberView> createState() =>
      _OnboardingMobileNumberViewState();
}

class _OnboardingMobileNumberViewState
    extends State<OnboardingMobileNumberView> {
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
                "Hello",
                style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                "Enter your mobile number",
                style: TextStyle(
                  color: AppColors.hintInfotextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextFieldWidget(
                labelText: "Enter mobile number",
                controller: value.mobileNumberController,
                onChanged: (updatedText) {
                  value.setMobileNumberController = updatedText ?? "";
                },
                prefixText: "+91 ",
                validator: (value) => AppValidators.validatePhone(value),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                textFeildType: TextFeildType.mobile,
              ),
              SizedBox(height: 10.h),
              Text.rich(
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
                        ..onTap = () {
                          Get.toNamed(
                            Routes.SIGN_IN_MOBILE,
                            arguments: Role.agent,
                          );
                        },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Consumer<OnboardingProvider>(
                builder: (_, value, __) => CustomTextButton(
                  title: "sign up with OTP",
                  onPressed: AppValidators.validatePhone(
                            value.mobileNumberController.text,
                          ) !=
                          null
                      ? null
                      : () async {
                          if (await value.sendMobileOtp()) {
                            value.currentStep =
                                OnboardingSteps.verify_mobile_otp;
                            Get.toNamed(Routes.ONBOARDING_VERIFY_MOBILE_OTP);
                          }
                        },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
