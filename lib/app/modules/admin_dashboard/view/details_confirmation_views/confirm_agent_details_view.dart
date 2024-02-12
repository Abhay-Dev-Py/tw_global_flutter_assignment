import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/models/agent_details_verification_model.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_bottom_sheets.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_containter_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ConfirmAgentDetailsView extends StatefulWidget {
  const ConfirmAgentDetailsView({Key? key}) : super(key: key);

  @override
  State<ConfirmAgentDetailsView> createState() =>
      _ConfirmAgentDetailsViewState();
}

class _ConfirmAgentDetailsViewState extends State<ConfirmAgentDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDashboardProvider>(
      builder: (context, value, __) {
        return AppScaffold(
          isBackEnabled: false,
          isFromAgentOnboarding: true,
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
                      "Agent Details",
                      isEditRequired: value.isAgentDetailsEditable,
                      edit: () {
                        value.isAgentDetailsEditable =
                            !value.isAgentDetailsEditable;
                      },
                    ),
                    SizedBox(height: 12.h),
                    showAgentDetails(
                      isEditable: value.isAgentDetailsEditable,
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
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ],
          ),
          bottomSheet: Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  title: "approve",
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.red,
                      ),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Center(
                      child: Text(
                        "reject",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomSheetHeight: 54.h,
        );
      },
    );
  }

  Widget showAgentDetails({bool isEditable = false}) {
    return CustomContainer(
      borderColor: AppColors.lightBlue,
      containerColor: AppColors.white,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          detailsRowWidget(
            left: "Full name",
            right: getVerificationModel.panDetails.fullName ?? "",
            isEditable: !isEditable,
            detail: ReviewAgentDetails.full_name,
          ),
          detailsRowWidget(
            left: "Date of birth",
            right: getVerificationModel.panDetails.dateOfBirth ?? "",
            isEditable: false,
            detail: ReviewAgentDetails.dob,
          ),
          detailsRowWidget(
            left: "Email ID",
            right: getVerificationModel.emailAddress ?? "",
            isEditable: false,
            detail: ReviewAgentDetails.email,
          ),
          detailsRowWidget(
            left: "Mobile Number",
            right: getVerificationModel.mobileNumber ?? "",
            isEditable: false,
            detail: ReviewAgentDetails.mobile_number,
          ),
          detailsRowWidget(
            left: "PAN Number",
            right: getVerificationModel.panDetails.panNumber ?? "",
            isEditable: false,
            isDividerRequired: false,
            detail: ReviewAgentDetails.pan_number,
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
            right: getVerificationModel.shopDetails.shopName ?? "",
            isEditable: !isEditable,
            detail: ReviewAgentDetails.shop_name,
          ),
          detailsRowWidget(
            left: "Shop address",
            right: getVerificationModel.shopDetails.shopAddress ?? "",
            isEditable: !isEditable,
            detail: ReviewAgentDetails.shop_address,
          ),
          detailsRowWidget(
            left: "City",
            right: getVerificationModel.shopDetails.city ?? "",
            isEditable: !isEditable,
            detail: ReviewAgentDetails.city,
          ),
          detailsRowWidget(
            left: "State",
            right: getVerificationModel.shopDetails.state ?? "",
            isEditable: !isEditable,
            detail: ReviewAgentDetails.state,
          ),
          detailsRowWidget(
            left: "Country",
            right: getVerificationModel.shopDetails.country ?? "",
            isEditable: false,
            isDividerRequired: false,
            detail: ReviewAgentDetails.country,
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
    required ReviewAgentDetails detail,
    bool isDividerRequired = true,
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: MyText(
                        title: detail == ReviewAgentDetails.pan_number
                            ? right.maskCharacters()
                            : right,
                        color: AppColors.indigo,
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.end,
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

  Widget sheetProfile(ReviewAgentDetails detail) {
    return Consumer<AdminDashboardProvider>(
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

  String getSheetHeaderString(ReviewAgentDetails detail) {
    switch (detail) {
      case ReviewAgentDetails.full_name:
        return "Update full name";

      case ReviewAgentDetails.dob:
        return "Update date of birth";
      case ReviewAgentDetails.email:
        return "Update email";
      case ReviewAgentDetails.mobile_number:
        return "Update mobile number";
      case ReviewAgentDetails.pan_number:
        return "Update PAN number";
      case ReviewAgentDetails.shop_name:
        return "Update shop name";
      case ReviewAgentDetails.shop_address:
        return "Update shop address";
      case ReviewAgentDetails.city:
        return "Update city";
      case ReviewAgentDetails.state:
        return "Update state";
      case ReviewAgentDetails.country:
        return "Update";
      case ReviewAgentDetails.pincode:
        return "Update pincode";
    }
  }

  Column textFieldWidget({
    required ReviewAgentDetails detail,
    required AdminDashboardProvider provider,
  }) {
    switch (detail) {
      case ReviewAgentDetails.full_name:
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
                      provider.setVerificationDetails(
                        detail,
                        provider.fullNameController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );

      case ReviewAgentDetails.dob:
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
                      provider.setVerificationDetails(
                        detail,
                        provider.dobController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );

      case ReviewAgentDetails.email:
        break;
      case ReviewAgentDetails.mobile_number:
        break;
      case ReviewAgentDetails.pan_number:
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
                      provider.setVerificationDetails(
                        detail,
                        provider.panNumberController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );

      case ReviewAgentDetails.shop_name:
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
                      provider.setVerificationDetails(
                        detail,
                        provider.shopNameController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );

      case ReviewAgentDetails.shop_address:
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
                      provider.setVerificationDetails(
                        detail,
                        provider.shopAddressController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );
      case ReviewAgentDetails.city:
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
                      provider.setVerificationDetails(
                        detail,
                        provider.cityController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );
      case ReviewAgentDetails.state:
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
                      provider.setVerificationDetails(
                        detail,
                        provider.stateController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );
      case ReviewAgentDetails.country:
        break;
      case ReviewAgentDetails.pincode:
        return Column(
          children: [
            CustomTextFieldWidget(
              labelText: "Enter pincode",
              controller: provider.pincodeController,
              onChanged: (updatedText) {
                provider.pincodeController.text = updatedText ?? "";
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
                        provider.pincodeController.text,
                      ) !=
                      null
                  ? null
                  : () {
                      provider.setVerificationDetails(
                        detail,
                        provider.pincodeController.text,
                      );
                      Navigator.pop(context);
                    },
            ),
          ],
        );
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
                  provider.setVerificationDetails(
                    detail,
                    provider.shopNameController.text,
                  );
                  Navigator.pop(context);
                },
        ),
      ],
    );
  }

  String? fetchValidator(String? value, ReviewAgentDetails detail) {
    switch (detail) {
      case ReviewAgentDetails.full_name:
        return AppValidators.validateEmpty(value);
      case ReviewAgentDetails.dob:
        return AppValidators.validateDOB(value);
      case ReviewAgentDetails.email:
        return AppValidators.validateEmail(value);
      case ReviewAgentDetails.mobile_number:
        return AppValidators.validatePhone(value);
      case ReviewAgentDetails.pan_number:
        return AppValidators.validatePAN(value);
      case ReviewAgentDetails.shop_name:
        return AppValidators.validateEmpty(value);
      case ReviewAgentDetails.shop_address:
        return AppValidators.validateEmpty(value);
      case ReviewAgentDetails.city:
        return AppValidators.validateEmpty(value);
      case ReviewAgentDetails.state:
        return AppValidators.validateEmpty(value);
      case ReviewAgentDetails.country:
        return AppValidators.validateEmpty(value);
      case ReviewAgentDetails.pincode:
        return AppValidators.validateEmpty(value);

      default:
        return AppValidators.validateEmpty(value);
    }
  }
}
