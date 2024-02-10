import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class OnboardingEsignView extends StatefulWidget {
  const OnboardingEsignView({Key? key}) : super(key: key);

  @override
  State<OnboardingEsignView> createState() => _OnboardingEsignViewState();
}

class _OnboardingEsignViewState extends State<OnboardingEsignView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).whenComplete(() {
      Provider.of<OnboardingProvider>(context, listen: false).currentStep =
          OnboardingSteps.all_set;
      Get.toNamed(Routes.ONBOARDING_SUCCESS);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBackEnabled: false,
      isFromAgentOnboarding: true,
      isPaddingRequired: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.lottie.coinLoaderAnimationJson,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              "Redirecting to complete e-sign",
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              "Kindly wait a moment as we redirect you to complete e-sign",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.hintInfotextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
