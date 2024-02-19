import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_containter_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:provider/provider.dart';

class BiometricStepsView extends StatefulWidget {
  const BiometricStepsView({Key? key}) : super(key: key);

  @override
  State<BiometricStepsView> createState() => _BiometricStepsViewState();
}

class _BiometricStepsViewState extends State<BiometricStepsView> {
  @override
  void initState() {
    Provider.of<AdminDashboardProvider>(context, listen: false)
        .checkBiometricStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDashboardProvider>(
      builder: (context, value, __) {
        return AppScaffold(
          inAsyncCall: value.inAsyncCall,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Biometric',
                style: TextStyle(
                  color: AppColors.indigo,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Agent to place finger on the biometric device for confirmation',
                style: TextStyle(
                  color: AppColors.indigo,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 16.w,
                ),
                decoration: ShapeDecoration(
                  color: AppColors.lightBlue,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: AppColors.white),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please ensure that',
                      style: TextStyle(
                        color: AppColors.indigo,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ...List.generate(
                      value.biometricStepModel.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                value.biometricStepModel[index].completionStatus
                                    ? const Icon(
                                        Icons.check_circle_rounded,
                                        color: AppColors.blue,
                                      )
                                    : Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.red,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: AppColors.white,
                                        ),
                                      ),
                                SizedBox(width: 10.w),
                                Text(
                                  value.biometricStepModel[index]
                                      .stepDescription,
                                  style: TextStyle(
                                    color: AppColors.indigo,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            if (value.biometricStepModel[index].step ==
                                    BiometricSteps.rd_service_app_status &&
                                !value
                                    .biometricStepModel[index].completionStatus)
                              CustomContainer(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.h,
                                  horizontal: 24.w,
                                ),
                                margin: EdgeInsets.only(top: 12.h),
                                height: 28.h,
                                width: 118.w,
                                child: Text(
                                  'Install now',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const Spacer(),
              if (value.rdServiceAppInstalled)
                CustomTextButton(
                  title: "confirm",
                  onPressed: AppValidators.validateOTP(
                            value.mobileOTPController.text,
                          ) !=
                          null
                      ? null
                      : () {}
                  // : () async {
                  //     if (await value.verifyMobileOtp()) {
                  //       value.disposeTimer();
                  //       value.currentStep =
                  //           OnboardingSteps.enter_email_address;
                  //       Get.toNamed(Routes.ONBOARDING_EMAIL_ADDRESS);
                  //     }
                  //   },
                  ,
                ),
            ],
          ),
        );
      },
    );
  }
}
