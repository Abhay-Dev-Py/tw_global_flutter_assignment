import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/models/agent_onboarding_model.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class OnboardingSuccessView extends StatefulWidget {
  const OnboardingSuccessView({Key? key}) : super(key: key);

  @override
  State<OnboardingSuccessView> createState() => _OnboardingSuccessViewState();
}

class _OnboardingSuccessViewState extends State<OnboardingSuccessView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBackEnabled: false,
      onBackPress: () {
        Get.offAllNamed(Routes.AGENT_DASHBOARD);
      },
      body: Column(
        children: [
          SizedBox(height: 108.h),
          Lottie.asset(
            AppAssets.lottie.successTickAnimationJson,
            width: 162.w,
            height: 162.h,
          ),
          SizedBox(height: 40.h),
          Text(
            "You're all set,\n${getOnboardingModel.panDetails.fullName?.split(" ")[0] ?? ""}!",
            style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            "Our team will visit for offline verification shortly. You will receive a call from the admin who will inform about the timings for the visit to conduct the verification.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.hintInfotextColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.h),
          Text(
            "Please ensure you're at the office during the visit.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.hintInfotextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Consumer<OnboardingProvider>(
            builder: (_, value, __) => Column(
              children: [
                CustomTextButton(
                  title: "go to dashboard",
                  onPressed: () {
                    Get.offAllNamed(Routes.AGENT_DASHBOARD);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
