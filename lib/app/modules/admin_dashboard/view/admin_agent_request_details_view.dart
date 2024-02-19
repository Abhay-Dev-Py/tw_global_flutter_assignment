import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/agent_request_model.dart';
import 'package:flutter_getx_template/app/modules/widgets/base_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_bottom_sheets.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
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
                        showRejectionDialog(context: context);
                        // showBottomsheet(
                        //   context: context,
                        //   content: sheetProfile(),
                        //   showCloseButton: true,
                        //   closeButtonheight: 0.40.sh,
                        // );
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

