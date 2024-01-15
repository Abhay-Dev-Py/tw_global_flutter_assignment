import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/localizations/localization_provider.dart';
import 'package:flutter_getx_template/app/modules/login/controller/login_controller.dart';
import 'package:flutter_getx_template/app/modules/login/localization/login_localization.dart';
import 'package:flutter_getx_template/app/modules/login/view/local_widgets/admin_info_widget.dart';
import 'package:flutter_getx_template/app/modules/login/view/local_widgets/role_switch_widget.dart';
import 'package:provider/provider.dart';

import 'local_widgets/agent_info_widget.dart';

class AppLoginView extends StatefulWidget {
  const AppLoginView({Key? key}) : super(key: key);

  @override
  State<AppLoginView> createState() => _AppLoginViewState();
}

class _AppLoginViewState extends State<AppLoginView> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginProvider, LocalizationProvider>(
      builder: (context, loginProvider, languageProvider, snapshot) {
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
                                  loginProvider.onGetStarted(role);
                                  // AppNavigation.navigatorKey.currentContext!.
                                  // context.goNamed(Routes.ONBOARDING_LOCATION);
                                },
                                onSignIn: (Role role) {
                                  loginProvider.onSignIn(role);
                                  languageProvider.setCurrentLanguage =
                                      Languages.hindi;
                                  // if (languageProvider.currentLanguage == Languages.english) {
                                  //   languageProvider.setCurrentLanguage = Languages.hindi;
                                  // } else {
                                  //   languageProvider.setCurrentLanguage = Languages.english;
                                  // }
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
                        role: LoginTranslations.agent.trs,
                        onPressed: (role) {
                          loginProvider.setRole = Role.agent;
                        },
                      ),
                      RoleSwitchWidget(
                        isSelected: loginProvider.role == Role.admin,
                        role: LoginTranslations.admin.trs,
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
