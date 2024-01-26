import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingPanDetailsView extends StatefulWidget {
  const OnboardingPanDetailsView({Key? key}) : super(key: key);

  @override
  State<OnboardingPanDetailsView> createState() =>
      _OnboardingPanDetailsViewState();
}

class _OnboardingPanDetailsViewState extends State<OnboardingPanDetailsView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            "PAN details",
            style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
          ),
          SizedBox(height: 8.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, _) {
              return Text(
                "Please enter the details as per your PAN card information",
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
                labelText: "PAN Number",
                controller: value.panNumberController,
                onChanged: (updatedText) {
                  value.setPanNumberControllerValue =
                      updatedText?.toUpperCase() ?? "";
                },
                validator: (value) => AppValidators.validatePAN(value),
                maxLength: 10,
                obsecureText: !value.showPanNumber,
                suffixIcon: GestureDetector(
                  onTap: () {
                    value.showPanNumber = !value.showPanNumber;
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: SvgPicture.asset(
                      value.showPanNumber
                          ? AppAssets.svgs.passwordHideSvg
                          : AppAssets.svgs.passwordShowSvg,
                    ),
                  ),
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 28.h,
                  maxWidth: 28.w,
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, _) {
              return CustomTextFieldWidget(
                labelText: "Full name",
                controller: value.fullNameController,
                onChanged: (updatedText) {
                  value.setFullNameControllerValue = updatedText ?? "";
                },
                validator: (value) => AppValidators.validateEmpty(value),
                maxLength: 20,
              );
            },
          ),
          SizedBox(height: 10.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, _) {
              return CustomTextFieldWidget(
                labelText: "Date of birth",
                controller: value.dobController,
                validator: (value) => AppValidators.validateDOB(value),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  value.setDobControllerValue = date?.toIso8601String();
                },
              );
            },
          ),
          const Spacer(),
          Consumer<OnboardingProvider>(
            builder: (_, value, __) => Column(
              children: [
                CustomTextButton(
                  title: "submit",
                  onPressed: () {
                    value.currentStep = OnboardingSteps.enter_shop_details;
                    Get.toNamed(Routes.ONBOARDING_SHOP_DETAILS);
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
