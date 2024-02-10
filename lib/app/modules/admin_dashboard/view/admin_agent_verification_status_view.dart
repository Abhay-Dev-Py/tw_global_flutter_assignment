import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/agent_verification_step_model.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_containter_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AdminAgentVerificationStatusView extends StatefulWidget {
  const AdminAgentVerificationStatusView({Key? key}) : super(key: key);

  @override
  State<AdminAgentVerificationStatusView> createState() =>
      _AdminAgentVerificationStatusViewState();
}

class _AdminAgentVerificationStatusViewState
    extends State<AdminAgentVerificationStatusView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDashboardProvider>(
      builder: (context, adminDashboardProvider, __) {
        return AppScaffold(
          isPaddingRequired: false,
          statusBarColor: AppColors.skin,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 24.h,
              ),
            ),
            backgroundColor: AppColors.skin,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: Text(
                  "help",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      color: AppColors.skin,
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Container(
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        adminDashboardProvider
                            .agentRequests[
                                adminDashboardProvider.selectedAgentRequest]
                            .name!,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 21.sp,
                          color: AppColors.indigo,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        adminDashboardProvider
                            .agentRequests[
                                adminDashboardProvider.selectedAgentRequest]
                            .address!,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColors.hintInfotextColor,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                adminDashboardProvider
                                    .agentVerificationSteps.length,
                                (index) => VerificationStepWidget(
                                  model: adminDashboardProvider
                                      .agentVerificationSteps[index],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class VerificationStepWidget extends StatelessWidget {
  final AgentVerificationStepModel model;
  const VerificationStepWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: model.isActive
              ? () {
                  Get.toNamed(model.stepNavigationRoute);
                }
              : null,
          child: CustomContainer(
            height: 64.h,
            width: double.infinity,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            child: Row(
              children: [
                Container(
                  height: 24.h,
                  width: 24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: model.isActive
                        ? AppColors.lightBlue
                        : AppColors.lightGrey,
                  ),
                  child: Center(
                    child: Container(
                      height: 12.h,
                      width: 12.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            model.isActive ? AppColors.blue : AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      model.stepTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.indigo,
                      ),
                    ),
                    Text(
                      model.stepDescription,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColors.hintInfotextColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                if (model.isActive) const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        if (model.step != AgentVerificationFlowStep.biometric)
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Container(
              height: 16.h,
              width: 2.w,
              color: const Color.fromARGB(255, 202, 200, 216),
            ),
          ),
      ],
    );
  }
}
