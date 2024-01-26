import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/providers/passcode_provider.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_passcode_keyboard.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: ShapeDecoration(
              color: AppColors.lightGrey,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: AppColors.blue),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: MyText(
                    title: "Set Appreciate Passcode",
                    color: AppColors.hintInfotextColor,
                  ),
                ),
                SizedBox(height: 1.sh * 0.01),
                const CircularPasscodeInput(),
              ],
            ),
          ),
          // SizedBox(height: 0.025.sh),
          const Spacer(),
          Consumer2<OnboardingProvider, PasscodeProvider>(
            builder: (context, onboardingProvider, passcodeProvider, __) {
              return SizedBox(
                // height: 200.h,
                child: NumberKeyboard(
                  type: PassCodeType.signupsetPasscode,
                  userName: '',
                  onPasscodeTyped: (passcodeValue) {
                    onboardingProvider.setPasscodeControllerValue =
                        passcodeValue;
                    onboardingProvider.currentStep =
                        OnboardingSteps.confirm_passcode;
                    Get.toNamed(Routes.ONBOARDING_CONFIRM_PASSCODE);
                    // clear passcode
                    passcodeProvider.clearPassCode();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
