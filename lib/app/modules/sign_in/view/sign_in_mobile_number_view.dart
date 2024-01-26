import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/landing/controller/landing_controller.dart';
import 'package:flutter_getx_template/app/modules/sign_in/controller/sign_in_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignInMobileNumberView extends StatefulWidget {
  const SignInMobileNumberView({Key? key}) : super(key: key);

  @override
  State<SignInMobileNumberView> createState() => _SignInMobileNumberViewState();
}

class _SignInMobileNumberViewState extends State<SignInMobileNumberView> {
  Role role = Role.agent;
  @override
  void initState() {
    // fetch the role
    role = Get.arguments as Role? ?? Role.agent;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (context, value, __) {
        return AppScaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Sign in to continue",
                style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 24.h),
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
              SizedBox(height: 20.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: AppTextStyle.lightStyle.copyWith(
                        fontWeight: FontWeight.w200,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: "sign up",
                      style: AppTextStyle.regularStyle.copyWith(
                        color: AppColors.blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AppLandingProvider()
                              .onGetStarted(role: role, isFromSignIn: true);
                          Get.offAndToNamed(Routes.ONBOARDING_LOCATION);
                        },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomTextButton(
                title: "sign in",
                onPressed: AppValidators.validatePhone(
                          value.mobileNumberController.text,
                        ) !=
                        null
                    ? null
                    : () {
                        // call api and ask for passcode
                        Get.offAllNamed(Routes.SIGN_IN_PASSCODE_VERIFY);
                      },
              ),
            ],
          ),
        );
      },
    );
  }
}
