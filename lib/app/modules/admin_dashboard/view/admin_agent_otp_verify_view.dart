import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/providers/passcode_provider.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_passcode_keyboard.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AdminAgentOtpVerifyView extends StatefulWidget {
  const AdminAgentOtpVerifyView({Key? key}) : super(key: key);

  @override
  State<AdminAgentOtpVerifyView> createState() =>
      _AdminAgentOtpVerifyViewState();
}

class _AdminAgentOtpVerifyViewState extends State<AdminAgentOtpVerifyView> {
  @override
  void initState() {
    Provider.of<OnboardingProvider>(context, listen: false).startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDashboardProvider>(
      builder: (context, adminDashboardProvider, __) {
        return AppScaffold(
          appBar:AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Enter OTP to start verification",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "You will get the OTP from ${adminDashboardProvider.agentRequests[adminDashboardProvider.selectedAgentRequest].name!.split(" ")[0]}",
                style: AppTextStyle.lightStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                ),
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
                        title: "Enter OTP",
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
              Consumer2<AdminDashboardProvider, PasscodeProvider>(
                builder:
                    (context, adminDashboardProvider, passcodeProvider, __) {
                  return SizedBox(
                    // height: 200.h,
                    child: NumberKeyboard(
                      type: PassCodeType.signupsetPasscode,
                      userName: '',
                      onPasscodeTyped: (passcodeValue) {
                        adminDashboardProvider.setAgentOtpControllerValue =
                            passcodeValue;
                        Get.toNamed(Routes.ADMIN_AGENT_VERIFICATION_STATUS);
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
      },
    );
  }

  @override
  void dispose() {
    Provider.of<OnboardingProvider>(context, listen: false).disposeTimer();
    super.dispose();
  }
}
