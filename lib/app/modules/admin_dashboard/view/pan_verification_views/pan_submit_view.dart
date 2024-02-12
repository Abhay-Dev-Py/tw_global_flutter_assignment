import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_checkbox_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_rich_text_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:provider/provider.dart';

class PanSubmitView extends StatefulWidget {
  const PanSubmitView({Key? key}) : super(key: key);

  @override
  State<PanSubmitView> createState() => _PanSubmitViewState();
}

class _PanSubmitViewState extends State<PanSubmitView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDashboardProvider>(
      builder: (context, adminDashboardProvider, __) {
        return AppScaffold(
          isPaddingRequired: true,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 24.h,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PAN verification",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 21.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Upload the front side of agent's PAN card",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 48.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    height: 192.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 27.w,
                      vertical: 19.h,
                    ),
                    decoration: BoxDecoration(
                      border: DashedBorder.fromBorderSide(
                        dashLength: 15,
                        side: BorderSide(
                          color: AppColors.darkGrey,
                          width: 2.w,
                        ),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomTextFieldWidget(
                  labelText: "PAN Number",
                  controller: adminDashboardProvider.panNumberController,
                  onChanged: (updatedText) {
                    adminDashboardProvider.setPanNumberControllerValue =
                        updatedText?.toUpperCase() ?? "";
                  },
                  validator: (value) => AppValidators.validatePAN(value),
                  maxLength: 10,
                  obsecureText: !adminDashboardProvider.showPanNumber,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      adminDashboardProvider.showPanNumber =
                          !adminDashboardProvider.showPanNumber;
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: SvgPicture.asset(
                        !adminDashboardProvider.showPanNumber
                            ? AppAssets.svgs.passwordHideSvg
                            : AppAssets.svgs.passwordShowSvg,
                      ),
                    ),
                  ),
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 28.h,
                    maxWidth: 28.w,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomTextFieldWidget(
                  labelText: "Full name",
                  controller: adminDashboardProvider.fullNameController,
                  onChanged: (updatedText) {
                    adminDashboardProvider.setFullNameControllerValue =
                        updatedText ?? "";
                  },
                  validator: (value) => AppValidators.validateEmpty(value),
                  maxLength: 20,
                ),
                SizedBox(height: 12.h),
                CustomTextFieldWidget(
                  labelText: "Father's Name",
                  controller: adminDashboardProvider.fatherNameController,
                  onChanged: (updatedText) {
                    adminDashboardProvider.setFatherNameControllerValue =
                        updatedText ?? "";
                  },
                  validator: (value) => AppValidators.validateEmpty(value),
                  maxLength: 20,
                ),
                SizedBox(height: 12.h),
                CustomCheckboxWidget(
                  titleWidget: CustomRichTextWidget(
                    title:
                        "I confirm that the uploaded PAN image and corresponding information are correct",
                    titleStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.hintInfotextColor,
                    ),
                    subtitle: "",
                    subtitleStyle: AppTextStyle.regularStyle.copyWith(
                      color: AppColors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  value: adminDashboardProvider.getIsPanSubmitTerm,
                  onSaved: (newValue) {
                    adminDashboardProvider.setIsPanSubmitTermAccepted =
                        newValue ?? false;
                  },
                ),
                SizedBox(height: 12.h),
                Row(
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
              ],
            ),
          ),
        );
      },
    );
  }
}
