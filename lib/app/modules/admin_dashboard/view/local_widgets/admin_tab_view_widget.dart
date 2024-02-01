import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';

import '../../../../common/util/exports.dart';

class AgentTabViewWidget extends StatelessWidget {
  final AdminDashboardProvider adminProvider;
  const AgentTabViewWidget({
    Key? key,
    required this.adminProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 36.h,
        padding: EdgeInsets.only(top: 10.h, left: 24.w, right: 24.w),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => adminProvider.selectedTab = AdminSelectedTab.pending,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pending',
                    style: TextStyle(
                      color:
                          adminProvider.selectedTab == AdminSelectedTab.pending
                              ? AppColors.blue
                              : AppColors.darkGrey,
                      fontSize: 14.sp,
                      fontWeight:
                          adminProvider.selectedTab == AdminSelectedTab.pending
                              ? FontWeight.w800
                              : FontWeight.w500,
                    ),
                  ),
                  if (adminProvider.selectedTab == AdminSelectedTab.pending)
                    const SizedBox(height: 10),
                  if (adminProvider.selectedTab == AdminSelectedTab.pending)
                    Container(
                      width: 19,
                      height: 1,
                      decoration: ShapeDecoration(
                        color: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.r),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ovalDot(),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: () =>
                  adminProvider.selectedTab = AdminSelectedTab.in_progress,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'In progress',
                    style: TextStyle(
                      color: adminProvider.selectedTab ==
                              AdminSelectedTab.in_progress
                          ? AppColors.blue
                          : AppColors.darkGrey,
                      fontSize: 14.sp,
                      fontWeight: adminProvider.selectedTab ==
                              AdminSelectedTab.in_progress
                          ? FontWeight.w800
                          : FontWeight.w500,
                    ),
                  ),
                  if (adminProvider.selectedTab == AdminSelectedTab.in_progress)
                    const SizedBox(height: 10),
                  if (adminProvider.selectedTab == AdminSelectedTab.in_progress)
                    Container(
                      width: 19,
                      height: 1,
                      decoration: ShapeDecoration(
                        color: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.r),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ovalDot(),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () =>
                  adminProvider.selectedTab = AdminSelectedTab.verififed,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Verified',
                    style: TextStyle(
                      color: adminProvider.selectedTab ==
                              AdminSelectedTab.verififed
                          ? AppColors.blue
                          : AppColors.darkGrey,
                      fontSize: 14.sp,
                      fontWeight: adminProvider.selectedTab ==
                              AdminSelectedTab.verififed
                          ? FontWeight.w800
                          : FontWeight.w500,
                    ),
                  ),
                  if (adminProvider.selectedTab == AdminSelectedTab.verififed)
                    const SizedBox(height: 10),
                  if (adminProvider.selectedTab == AdminSelectedTab.verififed)
                    Container(
                      width: 19,
                      height: 1,
                      decoration: ShapeDecoration(
                        color: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.r),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox ovalDot() {
    return SizedBox(
      width: 3.w,
      height: 20.h,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 6.h,
            child: Container(
              width: 3.w,
              height: 3.h,
              decoration: const ShapeDecoration(
                color: Color(0xFFD1D0D7),
                shape: OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
