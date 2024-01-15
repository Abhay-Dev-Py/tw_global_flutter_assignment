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

class OnboardingSetPasscodeView extends StatefulWidget {
  const OnboardingSetPasscodeView({Key? key}) : super(key: key);

  @override
  State<OnboardingSetPasscodeView> createState() =>
      _OnboardingSetPasscodeViewState();
}

class _OnboardingSetPasscodeViewState extends State<OnboardingSetPasscodeView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            "Set Passcode",
            style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
          ),
          SizedBox(height: 8.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, _) {
              return Text(
                "Use this passcode for a safe and quick login to your account",
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
                labelText: "Set Appreciate Passcode",
                controller: value.passcodeController,
                onChanged: (updatedText) {
                  value.setPasscodeControllerValue = updatedText ?? "";
                },
                validator: (value) => AppValidators.validatePasscode(value),
                keyboardType: TextInputType.phone,
                maxLength: 4,
              );
            },
          ),
          const Spacer(),
          Consumer<OnboardingProvider>(
            builder: (_, value, __) => CustomTextButton(
              title: "confirm",
              onPressed: AppValidators.validatePasscode(
                        value.passcodeController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      if (value.passcodeController.text == "1234") {
                        value.currentStep = OnboardingSteps.confirm_passcode;
                        Get.toNamed(Routes.ONBOARDING_CONFIRM_PASSCODE);
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
