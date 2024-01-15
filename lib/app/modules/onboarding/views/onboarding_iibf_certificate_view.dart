import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_checkbox_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_rich_text_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingIIBFCertificateDetailsView extends StatefulWidget {
  const OnboardingIIBFCertificateDetailsView({Key? key}) : super(key: key);

  @override
  State<OnboardingIIBFCertificateDetailsView> createState() =>
      _OnboardingIIBFCertificateDetailsViewState();
}

class _OnboardingIIBFCertificateDetailsViewState
    extends State<OnboardingIIBFCertificateDetailsView> {
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
                "IIBF certification",
                style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                "Please enter the details as per your IIBF Certificate information",
                style: AppTextStyle.lightStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextFieldWidget(
                labelText: "Your IIBF registration number",
                controller: value.registrationNumberController,
                onChanged: (updatedText) {
                  value.setRegistrationNumberControllerValue =
                      updatedText ?? "";
                },
                validator: (value) => AppValidators.validateEmpty(value),
                maxLength: 20,
              ),
              SizedBox(height: 10.h),
              CustomTextFieldWidget(
                labelText: "Serial Number",
                controller: value.serialNumberController,
                onChanged: (updatedText) {
                  value.setSerialNumberController = updatedText ?? "";
                },
                validator: (value) => AppValidators.validateEmpty(value),
              ),
              SizedBox(height: 10.h),
              CustomTextFieldWidget(
                labelText: "Date of certificate issue",
                controller: value.dateOfCertificateIssueController,
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );

                  value.setDateOfCertificateIssueControllerValue =
                      date?.toIso8601String() ?? "";
                },
                validator: (value) => AppValidators.validateEmpty(value),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.doveGray,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_file,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "IIBF certificate photo",
                          style: AppTextStyle.lightStyle.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    // const Spacer(),
                    Text(
                      "upload",
                      style: AppTextStyle.lightStyle.copyWith(
                        fontWeight: FontWeight.w200,
                        fontSize: 14.sp,
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          persistentFooterButtons: [
            Column(
              children: [
                CustomCheckboxWidget(
                  titleWidget: CustomRichTextWidget(
                    title: "I accept ",
                    titleStyle: AppTextStyle.lightStyle.copyWith(
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp,
                    ),
                    subtitle: "terms and condition",
                    subtitleStyle: AppTextStyle.lightStyle.copyWith(
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp,
                      color: AppColors.blue,
                    ),
                  ),
                  value: value.getIsTnCAccepted,
                  onSaved: (newValue) {},
                ),
                Column(
                  children: [
                    CustomTextButton(
                      title: "proceed",
                      onPressed: () {
                        value.currentStep =
                            OnboardingSteps.enter_certificate_details;
                        Get.toNamed(Routes.ONBOARDING_CERTIFICATE_DETAILS);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
