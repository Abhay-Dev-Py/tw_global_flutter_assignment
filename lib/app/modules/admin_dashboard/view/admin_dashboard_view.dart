import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/view/local_widgets/admin_tab_view_widget.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/view/local_widgets/agent_request_card_widget.dart';
import 'package:flutter_getx_template/app/modules/agent_dashboard/view/local_widgets/dashboard_header_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({Key? key}) : super(key: key);

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDashboardProvider>(
      builder: (context, adminDashboardProvider, __) {
        return AppScaffold(
          isPaddingRequired: false,
          body: Column(
            children: [
              SizedBox(height: 17.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const DashboardHeader(
                  title: "Hi Santosh",
                  subtitle: "KYC Point, HSR Layout",
                  isNotificationBellRequired: false,
                ),
              ),
              SizedBox(height: 28.h),
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 8.h),
                        Container(
                          height: 0.75.sh,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: AppColors.lightGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: const Color(0x19061058),
                                blurRadius: 16.r,
                                offset: const Offset(0, 0),
                                spreadRadius: 6.r,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                SizedBox(height: 44.h),
                                const AdminSearchWidget(),
                                Expanded(
                                  child: ListView(
                                    children: [
                                      ...List.generate(
                                        adminDashboardProvider
                                            .agentRequests.length,
                                        (index) {
                                          if (adminDashboardProvider
                                                  .selectedTab ==
                                              adminDashboardProvider
                                                  .agentRequests[index]
                                                  .adminVerificationStatus) {
                                            return AgentRequestCard(
                                              agentModel: adminDashboardProvider
                                                  .agentRequests[index],
                                              onAgentRequestTap: () {
                                                if (adminDashboardProvider
                                                        .agentRequests[index]
                                                        .agentVerificationStatus ==
                                                    AgentVerificationStatus
                                                        .view_details) {
                                                  adminDashboardProvider
                                                          .selectedAgentRequest =
                                                      index;
                                                  Get.toNamed(
                                                    Routes
                                                        .ADMIN_AGENT_REQUEST_DETAILS,
                                                    arguments:
                                                        adminDashboardProvider
                                                                .agentRequests[
                                                            index],
                                                  );
                                                }
                                              },
                                            );
                                          } else {
                                            return const SizedBox();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    AgentTabViewWidget(
                      adminProvider: adminDashboardProvider,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AdminSearchWidget extends StatefulWidget {
  const AdminSearchWidget({Key? key}) : super(key: key);

  @override
  State<AdminSearchWidget> createState() => _AdminSearchWidgetState();
}

class _AdminSearchWidgetState extends State<AdminSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312.w,
      height: 46.h,
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 16.w,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded),
          SizedBox(width: 12.w),
          Text(
            'Search Agent',
            style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
