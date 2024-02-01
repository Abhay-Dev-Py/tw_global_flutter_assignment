import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingLocationView extends StatefulWidget {
  const OnboardingLocationView({Key? key}) : super(key: key);

  @override
  State<OnboardingLocationView> createState() => _OnboardingLocationViewState();
}

class _OnboardingLocationViewState extends State<OnboardingLocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Image.asset(
                AppAssets.pngs.onboardingLocation,
                height: 170.h,
                width: 248.w,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Welcome to Appreciate!",
                style: TextStyle(
                  color: AppColors.indigo,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Access the app by granting these permissions",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.indigo,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    AppAssets.svgs.locationSvg,
                    height: 32.h,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                            color: AppColors.indigo,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "We access your location during signup to prevent suspicious account activity",
                          style: TextStyle(
                            color: AppColors.hintInfotextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomTextButton(
                title: "allow permissions",
                onPressed: () {
                  Provider.of<OnboardingProvider>(context, listen: false)
                      .askLocationPermission()
                      .then((isGranted) {
                    if (isGranted) {
                      Provider.of<OnboardingProvider>(context, listen: false)
                          .currentStep = OnboardingSteps.enter_mobile_number;
                      Get.toNamed(Routes.ONBOARDING_MOBILE_NUMBER);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
