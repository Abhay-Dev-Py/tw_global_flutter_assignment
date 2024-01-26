import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/providers/passcode_provider.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/sign_in/controller/sign_in_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_passcode_keyboard.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_shake_error_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignInPasscodeVerifyView extends StatefulWidget {
  const SignInPasscodeVerifyView({Key? key}) : super(key: key);

  @override
  State<SignInPasscodeVerifyView> createState() =>
      _SignInPasscodeVerifyViewState();
}

class _SignInPasscodeVerifyViewState extends State<SignInPasscodeVerifyView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SignInProvider>(context, listen: false)
          .initializePasscodeVerify();
    });
    super.initState();
  }

  final _shakeKey = GlobalKey<ShakeErrorState>();
  @override
  Widget build(BuildContext context) {
    return Consumer2<SignInProvider, PasscodeProvider>(
      builder: (context, signInProvider, passcodeProvider, __) => AppScaffold(
        isBannerRequired: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Image.asset(
              AppAssets.pngs.signInAppreciateLogoNameBanner,
              scale: 0.8,
            ),
            SizedBox(height: 16.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Signing in as ${signInProvider.mobileNumberController.text} ",
                    style: AppTextStyle.lightStyle.copyWith(
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: "sign out",
                    style: AppTextStyle.regularStyle.copyWith(
                      color: AppColors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAndToNamed(Routes.LANDING);
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
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
                      title: "Enter Appreciate Passcode",
                      color: AppColors.hintInfotextColor,
                    ),
                  ),
                  SizedBox(height: 1.sh * 0.01),
                  ShakeError(
                    key: _shakeKey,
                    child: CircularPasscodeInput(
                      errorMsg: signInProvider.errorMsg,
                      attemptsRemaining: signInProvider.attemptsRemaining,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                signInProvider.useBiometrics();
              },
              child: Center(
                child: Text(
                  "use Face ID",
                  style: AppTextStyle.regularStyle.copyWith(
                    color: AppColors.blue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            NumberKeyboard(
              type: PassCodeType.signupsetPasscode,
              userName: '',
              onPasscodeTyped: signInProvider.passcodeAttempts == 0
                  ? null
                  : (passcodeValue) async {
                      // send the passcode with the api and if valid, go to agent dashboard
                      if (passcodeValue == "2222") {
                        Get.offAndToNamed(Routes.AGENT_DASHBOARD);
                      } else {
                        _shakeKey.currentState?.shake().then((value) {
                          passcodeProvider.clearPassCode();
                          signInProvider.passcodeAttempts--;
                        });
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}
