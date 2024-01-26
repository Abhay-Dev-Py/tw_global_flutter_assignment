import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/dashboard/view/local_widgets/dashboard_header_widget.dart';
import 'package:flutter_getx_template/app/modules/dashboard/view/local_widgets/dashboard_offline_verification_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:provider/provider.dart';

class AgentDashboardView extends StatefulWidget {
  const AgentDashboardView({Key? key}) : super(key: key);

  @override
  State<AgentDashboardView> createState() => _AgentDashboardViewState();
}

class _AgentDashboardViewState extends State<AgentDashboardView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, __) {
          return Column(
            children: [
              Expanded(
                flex: dashboardProvider.isAdminAssigned ? 8 : 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      const DashboardHeader(),
                      // dashboardProvider.isCertificateUploaded
                      //     ? const OfflineVerification()
                      //     : const UploadCertificate(),
                      OfflineVerification(
                        isAdminAssigned: dashboardProvider.isAdminAssigned,
                      ),
                    ],
                  ),
                ),
              ),
              if (dashboardProvider.isAdminAssigned)
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 72.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 23.h),
                        Text(
                          "OTP to start verification",
                          style: AppTextStyle.lightStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) {
                            return Container(
                              height: 40.h,
                              width: 36.w,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: AppTextStyle.headline5.copyWith(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
