import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/view/local_widgets/admin_tab_view_widget.dart';
import 'package:flutter_getx_template/app/modules/agent_dashboard/view/local_widgets/dashboard_header_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
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
      builder: (context, adminProvider, __) {
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
                        Container(
                          height: 8.h,
                        ),
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
                                SizedBox(height: 24.h),
                                Row(
                                  children: [
                                    Text(
                                      '27 DEC, 12:30 AM',
                                      style: TextStyle(
                                        color: AppColors.indigo,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'start verification',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: AppColors.blue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const AgentRequestCard(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    AgentTabViewWidget(
                      adminProvider: adminProvider,
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

class AgentRequestCard extends StatelessWidget {
  const AgentRequestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
