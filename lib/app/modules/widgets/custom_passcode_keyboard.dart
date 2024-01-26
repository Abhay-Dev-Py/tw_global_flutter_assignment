import 'package:either_dart/either.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/providers/passcode_provider.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:provider/provider.dart';

import 'custom_app_text.dart';

enum PassCodeType {
  signupsetPasscode,
  signupConfirmPasscode,
  signIn,
  forgotPassword,
  forgotSetPasscode,
  changePasscode,
  forgotConfirmPasscode,
  changeConfirmPasscode,
  signInSetPasscode,
  signInSetConfirmPasscode
}

//passcode -sign in/ signup
class NumberKeyboard extends StatelessWidget {
  final PassCodeType type;
  final ForgotPasswordType? forgotPasswordType;
  final String? userName;
  final AuthType? signInType;
  final Function? onPasscodeTyped;

  const NumberKeyboard({
    Key? key,
    required this.type,
    this.forgotPasswordType,
    this.userName,
    this.signInType,
    required this.onPasscodeTyped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        ...List.generate(
          9,
          (index) => _buildNumberButton(
            context,
            '${index + 1}',
            type,
            forgotPasswordType,
            userName!,
            onPasscodeTyped,
          ),
        ),
        const SizedBox.shrink(),
        _buildNumberButton(
          context,
          '0',
          type,
          forgotPasswordType,
          userName!,
          onPasscodeTyped,
        ),
        _buildDeleteButton(context),
      ],
    );
  }

  Widget _buildNumberButton(
    BuildContext context,
    String number,
    PassCodeType type,
    ForgotPasswordType? forgotPasswordType,
    String userName,
    Function? onPasscodeTyped,
  ) {
    final passcodeProvider = Provider.of<PasscodeProvider>(context);
    return GestureDetector(
      onTap: onPasscodeTyped != null
          ? () {
              if (type == PassCodeType.signupsetPasscode) {
                Either result = passcodeProvider.setAppPasscode(number);
                if (result.isRight) {
                  onPasscodeTyped(result.right);
                }
              }
            }
          : null,
      child: SizedBox(
        height: 50,
        width: 50,
        child: Center(
          child: MyText(
            title: number,
            size: 28,
            color: AppColors.indigo,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    final passcodeProvider = Provider.of<PasscodeProvider>(context);
    return GestureDetector(
      onTap: passcodeProvider.deletePasscode,
      child: Image.asset(
        AppAssets.pngs.commonCancelNumber,
      ),
    );
  }
}

class CircularPasscodeInput extends StatelessWidget {
  final PassCodeType? type;
  final ForgotPasswordType? forgotPasswordType;
  final String? errorMsg;
  final String? attemptsRemaining;
  final Function? onForgotPassword;

  const CircularPasscodeInput({
    Key? key,
    this.type,
    this.forgotPasswordType,
    this.errorMsg,
    this.attemptsRemaining,
    this.onForgotPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passcodeProvider = Provider.of<PasscodeProvider>(context);
    final passcode = passcodeProvider.passcode;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => _buildPasscodeDot(index < passcode.length),
          ),
        ),
        if (attemptsRemaining != null && attemptsRemaining!.isNotEmpty)
          SizedBox(height: 6.h),
        if (attemptsRemaining != null && attemptsRemaining!.isNotEmpty)
          Text(
            attemptsRemaining!,
            style: AppTextStyle.lightStyle.copyWith(
              fontWeight: FontWeight.w200,
              fontSize: 14.sp,
              color: AppColors.red,
            ),
          ),
        if (errorMsg != null) SizedBox(height: 6.h),
        if (errorMsg != null)
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: errorMsg!,
                  style: AppTextStyle.lightStyle.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 14.sp,
                  ),
                ),
                TextSpan(
                  text: " forgot passcode?",
                  style: AppTextStyle.lightStyle.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 14.sp,
                    color: AppColors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (onForgotPassword != null) {
                        onForgotPassword!();
                      }
                    },
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildPasscodeDot(bool filled) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? AppColors.lightBlue : Colors.white,
        border: Border.all(
          color: filled ? AppColors.blue : AppColors.lightBlue,
        ),
      ),
    );
  }
}
