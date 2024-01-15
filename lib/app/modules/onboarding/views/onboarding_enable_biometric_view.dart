import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingEnableBiometricView extends StatefulWidget {
  const OnboardingEnableBiometricView({Key? key}) : super(key: key);

  @override
  State<OnboardingEnableBiometricView> createState() =>
      _OnboardingEnableBiometricViewState();
}

class _OnboardingEnableBiometricViewState
    extends State<OnboardingEnableBiometricView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, value, __) {
        return AppScaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Enable biometric",
                style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                "For faster and hassle-free login",
                style: AppTextStyle.lightStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 90.h),
              Center(
                child: Image.asset(
                  AppAssets.images.biometric,
                ),
              ),
            ],
          ),
          persistentFooterButtons: [
            Column(
              children: [
                CustomTextButton(
                  title: "enable biometric",
                  onPressed: () {
                    value.currentStep = OnboardingSteps.enter_pan_details;
                    Get.toNamed(Routes.ONBOARDING_PAN_DETAILS);
                  },
                ),
                SizedBox(height: 20.h),
                Text(
                  "skip for now",
                  style: AppTextStyle.lightStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
