import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/models/agent_onboarding_model.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_bottom_sheets.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_containter_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingReviewDetailsView extends StatefulWidget {
  const OnboardingReviewDetailsView({Key? key}) : super(key: key);

  @override
  State<OnboardingReviewDetailsView> createState() =>
      _OnboardingEmailAddressViewState();
}

class _OnboardingEmailAddressViewState
    extends State<OnboardingReviewDetailsView> {
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
                "Review all details",
                style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                "Please confirm the details you've entered",
                style: AppTextStyle.lightStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 20.h),
                    detailHeading(
                      "Personal Details",
                      isEditRequired: value.isPersonationDetailsEditable,
                      edit: () {
                        value.isPersonationDetailsEditable =
                            !value.isPersonationDetailsEditable;
                      },
                    ),
                    SizedBox(height: 12.h),
                    showPersonalDetails(
                      isEditable: value.isPersonationDetailsEditable,
                    ),
                    SizedBox(height: 20.h),
                    detailHeading(
                      "Shop Details",
                      isEditRequired: value.isShopDetailsEditable,
                      edit: () {
                        value.isShopDetailsEditable =
                            !value.isShopDetailsEditable;
                      },
                    ),
                    SizedBox(height: 12.h),
                    showShopDetails(
                      isEditable: value.isShopDetailsEditable,
                    ),
                    SizedBox(height: 20.h),
                    detailHeading(
                      "IIBF certification",
                      isEditRequired: value.isCertificateDetailsEditable,
                      edit: () {
                        value.isCertificateDetailsEditable =
                            !value.isCertificateDetailsEditable;
                      },
                    ),
                    SizedBox(height: 12.h),
                    showCertificateDetails(
                      isEditable: value.isCertificateDetailsEditable,
                    ),
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ],
          ),
          bottomSheet: CustomTextButton(
            title: "Proceed",
            onPressed: () {
              value.currentStep = OnboardingSteps.schedule_offline_verification;
              Get.toNamed(Routes.ONBOARDING_SCHEDULE_OFFLINE_VERIFICATION);
            },
          ),
          bottomSheetHeight: 54.h,
        );
      },
    );
  }

  Widget showPersonalDetails({bool isEditable = false}) {
    return CustomContainer(
      borderColor: AppColors.lightBlue,
      containerColor: AppColors.white,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          detailsRowWidget(
            left: "Full name",
            right: getOnboardingModel.panDetails.fullName ?? "",
            isEditable: !isEditable,
            detail: ReviewDetails.full_name,
          ),
          detailsRowWidget(
            left: "Date of birth",
            right: getOnboardingModel.panDetails.dateOfBirth ?? "",
            isEditable: !isEditable,
            detail: ReviewDetails.dob,
          ),
          detailsRowWidget(
            left: "Email ID",
            right: getOnboardingModel.emailAddress ?? "",
            isEditable: false,
            detail: ReviewDetails.email,
          ),
          detailsRowWidget(
            left: "Mobile Number",
            right: getOnboardingModel.mobileNumber ?? "",
            isEditable: false,
            detail: ReviewDetails.mobile_number,
          ),
          detailsRowWidget(
            left: "PAN Number",
            right: getOnboardingModel.panDetails.panNumber ?? "",
            isEditable: !isEditable,
            isDividerRequired: false,
            detail: ReviewDetails.pan_number,
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Widget showShopDetails({bool isEditable = false}) {
    return CustomContainer(
      borderColor: AppColors.lightBlue,
      containerColor: AppColors.white,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          detailsRowWidget(
            left: "Shop name",
            right: getOnboardingModel.shopDetails.shopName ?? "",
            isEditable: !isEditable,
            detail: ReviewDetails.shop_name,
          ),
          detailsRowWidget(
            left: "Shop address",
            right: getOnboardingModel.shopDetails.shopAddress ?? "",
            isEditable: !isEditable,
            detail: ReviewDetails.shop_address,
          ),
          detailsRowWidget(
            left: "City",
            right: getOnboardingModel.shopDetails.city ?? "",
            isEditable: !isEditable,
            detail: ReviewDetails.city,
          ),
          detailsRowWidget(
            left: "State",
            right: getOnboardingModel.shopDetails.state ?? "",
            isEditable: !isEditable,
            detail: ReviewDetails.state,
          ),
          detailsRowWidget(
            left: "Country",
            right: getOnboardingModel.shopDetails.country ?? "",
            isEditable: false,
            isDividerRequired: false,
            detail: ReviewDetails.country,
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Widget showCertificateDetails({bool isEditable = false}) {
    return CustomContainer(
      borderColor: AppColors.lightBlue,
      containerColor: AppColors.white,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          detailsRowWidget(
            left: "IIBF registration number",
            right:
                getOnboardingModel.iibfCertificateDetails.registrationNumber ??
                    "",
            isEditable: !isEditable,
            detail: ReviewDetails.iibf_registration_number,
          ),
          detailsRowWidget(
            left: "Serial number",
            right: getOnboardingModel.iibfCertificateDetails.serialNumber ?? "",
            isEditable: !isEditable,
            detail: ReviewDetails.serial_number,
          ),
          detailsRowWidget(
            left: "Date of certificate issue",
            right: getOnboardingModel
                    .iibfCertificateDetails.dateOfCertificateIssue ??
                "",
            isEditable: !isEditable,
            detail: ReviewDetails.date_of_certificate_issue,
          ),
          detailsRowWidget(
            left: "IIBF certificate photo",
            right: getOnboardingModel
                    .iibfCertificateDetails.certificatePhotoFilePath ??
                "",
            isEditable: !isEditable,
            isView: true,
            isDividerRequired: false,
            detail: ReviewDetails.iibf_certificate_photo,
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Column detailsRowWidget({
    required String left,
    required String right,
    required bool isEditable,
    required ReviewDetails detail,
    bool isDividerRequired = true,
    bool isView = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 2.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: MyText(
                    title: left,
                    color: AppColors.hintInfotextColor,
                    textAlign: TextAlign.start,
                    size: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: MyText(
                          title: isView ? "view" : right,
                          color: isView ? AppColors.blue : AppColors.indigo,
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    if (isEditable)
                      GestureDetector(
                        onTap: () {
                          showBottomsheet(
                            context: context,
                            content: sheetProfile(detail),
                            showCloseButton: true,
                            closeButtonheight: 0.54.sh,
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0.h),
                          child: SvgPicture.asset(
                            AppAssets.svgs.editIconSvg,
                            height: 14.h,
                            width: 14.w,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        if (isDividerRequired)
          const Divider(
            thickness: 1,
            color: AppColors.lightGrey,
          ),
      ],
    );
  }

  Widget sheetProfile(ReviewDetails detail) {
    return Consumer<OnboardingProvider>(
      builder: (context, value, __) {
        return SizedBox(
          height: 0.40.sh,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.05.sw,
              vertical: 0.03.sh,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: MyText(
                    title: getSheetHeaderString(detail),
                    color: AppColors.indigo,
                    fontWeight: FontWeight.w800,
                    size: 21,
                  ),
                ),
                SizedBox(height: 20.h),
                textFieldWidget(
                  detail: detail,
                  provider: value,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column textFieldWidget({
    required ReviewDetails detail,
    required OnboardingProvider provider,
  }) {
    switch (detail) {
      case ReviewDetails.full_name:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Enter full name",
              controller: provider.fullNameController,
              onChanged: (updatedText) {
                provider.fullNameController.text = updatedText ?? "";
              },
              validator: (value) => fetchValidator(value, detail),
              keyboardType: TextInputType.text,
              maxLength: 20,
              textFeildType: TextFeildType.text,
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: "update",
              onPressed: AppValidators.validateEmpty(
                        provider.fullNameController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setOnboardingDetails(
                        detail,
                        provider.fullNameController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );

      case ReviewDetails.dob:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Date of birth",
              controller: provider.dobController,
              validator: (value) => AppValidators.validateDOB(value),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              suffixIcon: Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Icon(
                  Icons.calendar_month_outlined,
                  size: 22.h,
                  color: AppColors.indigo,
                ),
              ),
              onTap: () async {
                DateTime? date = DateTime(1900);
                FocusScope.of(context).requestFocus(FocusNode());

                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                provider.setDobControllerValue = date?.toIso8601String();
              },
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: "update",
              onPressed: AppValidators.validateDOB(
                        provider.dobController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setOnboardingDetails(
                        detail,
                        provider.dobController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );

      case ReviewDetails.email:
        break;
      case ReviewDetails.mobile_number:
        break;
      case ReviewDetails.pan_number:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Enter PAN number",
              controller: provider.panNumberController,
              onChanged: (updatedText) {
                provider.panNumberController.text =
                    updatedText?.toUpperCase() ?? "";
              },
              validator: (value) => fetchValidator(value, detail),
              keyboardType: TextInputType.text,
              maxLength: 20,
              textFeildType: TextFeildType.text,
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: "update",
              onPressed: AppValidators.validatePAN(
                        provider.panNumberController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setOnboardingDetails(
                        detail,
                        provider.panNumberController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );

      case ReviewDetails.shop_name:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Enter shop name",
              controller: provider.shopNameController,
              onChanged: (updatedText) {
                provider.shopNameController.text = updatedText ?? "";
              },
              // prefixText: "+91 ",
              validator: (value) => fetchValidator(value, detail),
              keyboardType: TextInputType.text,
              maxLength: 20,
              textFeildType: TextFeildType.text,
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: "update",
              onPressed: AppValidators.validateEmpty(
                        provider.shopNameController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setOnboardingDetails(
                        detail,
                        provider.shopNameController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );

      case ReviewDetails.shop_address:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Enter shop address",
              controller: provider.shopAddressController,
              onChanged: (updatedText) {
                provider.shopAddressController.text = updatedText ?? "";
              },
              // prefixText: "+91 ",
              validator: (value) => fetchValidator(value, detail),
              keyboardType: TextInputType.text,
              maxLength: 100,
              textFeildType: TextFeildType.text,
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: "update",
              onPressed: AppValidators.validateEmpty(
                        provider.shopAddressController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setOnboardingDetails(
                        detail,
                        provider.shopAddressController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );
      case ReviewDetails.city:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Enter city",
              controller: provider.cityController,
              onChanged: (updatedText) {
                provider.cityController.text = updatedText ?? "";
              },
              // prefixText: "+91 ",
              validator: (value) => fetchValidator(value, detail),
              keyboardType: TextInputType.text,
              maxLength: 20,
              textFeildType: TextFeildType.text,
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: "update",
              onPressed: AppValidators.validateEmpty(
                        provider.cityController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setOnboardingDetails(
                        detail,
                        provider.cityController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );
      case ReviewDetails.state:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Enter state",
              controller: provider.stateController,
              onChanged: (updatedText) {
                provider.stateController.text = updatedText ?? "";
              },
              validator: (value) => fetchValidator(value, detail),
              keyboardType: TextInputType.text,
              maxLength: 20,
              textFeildType: TextFeildType.text,
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: "update",
              onPressed: AppValidators.validateEmpty(
                        provider.stateController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setOnboardingDetails(
                        detail,
                        provider.stateController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );
      case ReviewDetails.country:
        break;
      case ReviewDetails.iibf_registration_number:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Enter IIBF registration number",
              controller: provider.shopNameController,
              onChanged: (updatedText) {
                provider.shopNameController.text =
                    updatedText?.toUpperCase() ?? "";
              },
              validator: (value) => fetchValidator(value, detail),
              keyboardType: TextInputType.text,
              maxLength: 20,
              textFeildType: TextFeildType.text,
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: "update",
              onPressed: AppValidators.validateIIBFRegistrationNumber(
                        provider.shopNameController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setOnboardingDetails(
                        detail,
                        provider.registrationNumberController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );

      case ReviewDetails.serial_number:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Enter IIBF serial number",
              controller: provider.serialNumberController,
              onChanged: (updatedText) {
                provider.serialNumberController.text = updatedText ?? "";
              },
              validator: (value) => fetchValidator(value, detail),
              keyboardType: TextInputType.text,
              maxLength: 20,
              textFeildType: TextFeildType.text,
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: "update",
              onPressed: AppValidators.validateIIBFSerial(
                        provider.serialNumberController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setOnboardingDetails(
                        detail,
                        provider.serialNumberController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );
      case ReviewDetails.date_of_certificate_issue:
      case ReviewDetails.iibf_certificate_photo:
        break;
    }
    return Column(
      children: [
        CustomTextFieldWidget(
          labelText: "Enter shop name",
          controller: provider.shopNameController,
          onChanged: (updatedText) {
            provider.shopNameController.text = updatedText ?? "";
          },
          // prefixText: "+91 ",
          validator: (value) => fetchValidator(value, detail),
          keyboardType: TextInputType.text,
          maxLength: 20,
          textFeildType: TextFeildType.text,
        ),
        SizedBox(height: 24.h),
        CustomTextButton(
          title: "update",
          onPressed: AppValidators.validateEmpty(
                    provider.shopNameController.text,
                  ) !=
                  null
              ? null
              : () {
                  provider.setOnboardingDetails(
                    detail,
                    provider.shopNameController.text,
                  );
                  Navigator.pop(context);
                },
        ),
      ],
    );
  }

  String? fetchValidator(String? value, ReviewDetails detail) {
    switch (detail) {
      case ReviewDetails.full_name:
        return AppValidators.validateEmpty(value);
      case ReviewDetails.dob:
        return AppValidators.validateDOB(value);
      case ReviewDetails.email:
        return AppValidators.validateEmail(value);
      case ReviewDetails.mobile_number:
        return AppValidators.validatePhone(value);
      case ReviewDetails.pan_number:
        return AppValidators.validatePAN(value);
      case ReviewDetails.shop_name:
        return AppValidators.validateEmpty(value);
      case ReviewDetails.shop_address:
        return AppValidators.validateEmpty(value);
      case ReviewDetails.city:
        return AppValidators.validateEmpty(value);
      case ReviewDetails.state:
        return AppValidators.validateEmpty(value);
      case ReviewDetails.country:
        return AppValidators.validateEmpty(value);
      case ReviewDetails.iibf_registration_number:
        return AppValidators.validateIIBFRegistrationNumber(value);
      case ReviewDetails.serial_number:
        return AppValidators.validateIIBFSerial(value);
      case ReviewDetails.date_of_certificate_issue:
        return AppValidators.validateEmpty(value);
      case ReviewDetails.iibf_certificate_photo:
        return AppValidators.validateEmpty(value);
      default:
        return AppValidators.validateEmpty(value);
    }
  }

  TextEditingController fetchTextEditingController({
    required ReviewDetails detail,
    required OnboardingProvider provider,
  }) {
    switch (detail) {
      case ReviewDetails.full_name:
        return provider.fullNameController;
      case ReviewDetails.dob:
        return provider.dobController;
      case ReviewDetails.email:
        return provider.emailAddressController;
      case ReviewDetails.mobile_number:
        return provider.mobileNumberController;
      case ReviewDetails.pan_number:
        return provider.panNumberController;
      case ReviewDetails.shop_name:
        return provider.shopNameController;
      case ReviewDetails.shop_address:
        return provider.shopAddressController;
      case ReviewDetails.city:
        return provider.cityController;
      case ReviewDetails.state:
        return provider.stateController;
      case ReviewDetails.country:
        return provider.countryController;
      case ReviewDetails.iibf_registration_number:
        return provider.registrationNumberController;
      case ReviewDetails.serial_number:
        return provider.serialNumberController;
      case ReviewDetails.date_of_certificate_issue:
        return provider.dateOfCertificateIssueController;
      case ReviewDetails.iibf_certificate_photo:
      default:
        return TextEditingController();
    }
  }

  String getSheetHeaderString(ReviewDetails detail) {
    switch (detail) {
      case ReviewDetails.full_name:
        return "Update full name";

      case ReviewDetails.dob:
        return "Update date of birth";
      case ReviewDetails.email:
        return "Update email";
      case ReviewDetails.mobile_number:
        return "Update mobile number";
      case ReviewDetails.pan_number:
        return "Update PAN number";
      case ReviewDetails.shop_name:
        return "Update shop name";
      case ReviewDetails.shop_address:
        return "Update shop address";
      case ReviewDetails.city:
        return "Update city";
      case ReviewDetails.state:
        return "Update state";
      case ReviewDetails.country:
        return "Update";
      case ReviewDetails.iibf_registration_number:
        return "Update IIBF registration number";
      case ReviewDetails.serial_number:
        return "Update IIBF serial number";
      case ReviewDetails.date_of_certificate_issue:
        return "Update IIBF certificate issue number";
      case ReviewDetails.iibf_certificate_photo:
        return "Update IIBF certificate photo";
    }
  }
}
