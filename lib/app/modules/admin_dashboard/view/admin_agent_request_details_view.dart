import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/agent_request_model.dart';
import 'package:flutter_getx_template/app/modules/widgets/base_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_bottom_sheets.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AdminAgentRequestDetailsView extends StatefulWidget {
  const AdminAgentRequestDetailsView({Key? key}) : super(key: key);

  @override
  State<AdminAgentRequestDetailsView> createState() =>
      _AdminAgentRequestDetailsViewState();
}

class _AdminAgentRequestDetailsViewState
    extends State<AdminAgentRequestDetailsView> {
  @override
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_rounded,
            size: 24.h,
          ),
        ),
      ),
      body: Consumer<AdminDashboardProvider>(
        builder: (context, adminDashboardProvider, __) {
          AgentRequestModel model = adminDashboardProvider
              .agentRequests[adminDashboardProvider.selectedAgentRequest];
          return Column(
            children: [
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        Text(
                          model.name!,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24.sp,
                            color: AppColors.indigo,
                          ),
                        ),
                        SizedBox(height: 18.h),
                        titleSubtitleWidget(
                          title: "LOCATION",
                          subtitle: model.address!,
                          button: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 76.w,
                                  height: 36.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(
                                      12.r,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.h,
                                    horizontal: 12.w,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.directions,
                                        color: AppColors.blue,
                                      ),
                                      Text(
                                        " 5KM",
                                        style:
                                            AppTextStyle.regularStyle.copyWith(
                                          color: AppColors.blue,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                "get directions",
                                style: AppTextStyle.regularStyle.copyWith(
                                  color: AppColors.blue,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        titleSubtitleWidget(
                          title: "MOBILE NUMBER",
                          subtitle: model.number!,
                          button: GestureDetector(
                            onTap: () {
                              Utils.launchCaller(model.number!);
                            },
                            child: Container(
                              width: 76.w,
                              height: 36.h,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                  12.r,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 12.w,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.call,
                                    color: AppColors.blue,
                                  ),
                                  Text(
                                    " call",
                                    style: AppTextStyle.regularStyle.copyWith(
                                      color: AppColors.blue,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    CustomTextButton(
                      title: "accept",
                      onPressed: () {},
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        // show rejection dialog
                        showBottomsheet(
                          context: context,
                          content: sheetProfile(),
                          showCloseButton: true,
                          closeButtonheight: 0.40.sh,
                        );
                      },
                      child: Text(
                        "reject",
                        style: AppTextStyle.lightStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget sheetProfile() {
  return Consumer<AdminDashboardProvider>(
    builder: (context, value, __) {
      return SizedBox(
        height: 0.555.sh,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.05.sw,
            vertical: 0.03.sh,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.pngs.commonSpeaker,
                  height: 72.h,
                ),
                SizedBox(height: 12.h),
                Text(
                  "Are you sure?",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 21.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "You are about to reject this field visit, please specify your reason to proceed.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.hintInfotextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                CustomTextFieldWidget(
                  labelText: "Enter reason",
                  hintText: "eg. Could not locate the shop",
                  controller: value.rejectReasonController,
                  onChanged: (updatedText) {
                    value.setRejectReasonControllerValue = updatedText ?? "";
                  },
                  validator: (value) => AppValidators.validateEmpty(value),
                  keyboardType: TextInputType.text,
                ),
                const Spacer(),
                CustomTextButton(
                  title: "confirm",
                  onPressed: AppValidators.validateEmpty(
                            value.rejectReasonController.text,
                          ) !=
                          null
                      ? null
                      : () {
                          Navigator.pop(context);
                          Get.back();
                        },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
