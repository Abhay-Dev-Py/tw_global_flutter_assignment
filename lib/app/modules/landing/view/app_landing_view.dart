import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/landing/controller/landing_controller.dart';
import 'package:flutter_getx_template/app/modules/landing/localization/landing_localization.dart';
import 'package:flutter_getx_template/app/modules/landing/view/local_widgets/admin_info_widget.dart';
import 'package:flutter_getx_template/app/modules/landing/view/local_widgets/role_switch_widget.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';

import 'local_widgets/agent_info_widget.dart';

class AppLandingView extends StatefulWidget {
  const AppLandingView({Key? key}) : super(key: key);

  @override
  State<AppLandingView> createState() => _AppLandingViewState();
}

class _AppLandingViewState extends State<AppLandingView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppLandingProvider>(
      builder: (context, loginProvider, snapshot) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(32.w),
                        child: loginProvider.role == Role.agent
                            ? AgentInfoWidget(
                                onGetStarted: (Role role) {
                                  loginProvider.onGetStarted(role: role);
                                },
                                onSignIn: (Role role) {
                                  loginProvider.onSignIn(role);
                                },
                              )
                            : AdminInfoWidget(
                                onSignIn: (Role role) {
                                  loginProvider.onSignIn(role);
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0.488.sh,
                left: 32.w,
                child: Container(
                  height: 46.h,
                  width: 184.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45.r),
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoleSwitchWidget(
                        isSelected: loginProvider.role == Role.agent,
                        role: LoginTranslations.agent.tr,
                        onPressed: (role) {
                          loginProvider.setRole = Role.agent;
                        },
                      ),
                      RoleSwitchWidget(
                        isSelected: loginProvider.role == Role.admin,
                        role: LoginTranslations.admin.tr,
                        onPressed: (role) {
                          loginProvider.setRole = Role.admin;
                        },
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
