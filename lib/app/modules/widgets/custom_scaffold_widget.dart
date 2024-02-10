import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_bottom_sheets.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatefulWidget {
  final bool inAsyncCall;
  final AppBar? appBar;
  final Widget body;
  final Color backgroundColor;
  final Widget? bottomSheet;
  final double? bottomSheetHeight;
  final bool isBannerRequired;
  final bool isScrollable;
  final bool isPaddingRequired;
  final bool isBackEnabled;
  final bool isFromAgentOnboarding;
  final Color statusBarColor;
  final Function? onBackPress;

  const AppScaffold({
    Key? key,
    this.inAsyncCall = false,
    this.appBar,
    required this.body,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.bottomSheet,
    this.bottomSheetHeight,
    this.isBannerRequired = false,
    this.isScrollable = false,
    this.isPaddingRequired = true,
    this.isBackEnabled = true,
    this.isFromAgentOnboarding = false,
    this.onBackPress,
    this.statusBarColor = AppColors.kPrimaryColor,
  }) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (!widget.isBackEnabled) {
          if (widget.isFromAgentOnboarding) {
            showBottomsheet(
              context: context,
              content: sheetProfile(),
              showCloseButton: true,
              closeButtonheight: 0.54.sh,
            );
          }
          if (widget.onBackPress != null) {
            widget.onBackPress!();
          }
          return false;
        }
        return true;
      },
      child: ModalProgressHUD(
        inAsyncCall: widget.inAsyncCall,
        progressIndicator:
            Lottie.asset(AppAssets.lottie.loaderAppreciateAnimationJson),
        child: Container(
          color: widget.statusBarColor,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: widget.statusBarColor,
            ),
            child: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                physics: widget.isScrollable
                    ? null
                    : const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  height: 0.9.sh,
                  child: Scaffold(
                    appBar: widget.appBar,
                    body: Stack(
                      children: [
                        if (widget.isBannerRequired)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Image.asset(
                              AppAssets.pngs.signInPasscodeBanner,
                            ),
                          ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: widget.isPaddingRequired ? 20.w : 0,
                            ),
                            child: widget.body,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: widget.backgroundColor,
                    // persistentFooterButtons: widget.persistentFooterButtons,
                    bottomSheet: widget.bottomSheet != null
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            height: widget.bottomSheetHeight ?? 54.h,
                            color: widget.backgroundColor,
                            child: widget.bottomSheet,
                          )
                        : null,
                    resizeToAvoidBottomInset: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget sheetProfile() {
    return Consumer<OnboardingProvider>(
      builder: (context, value, __) {
        return SizedBox(
          height: 0.40.sh,
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
                    "Signup Incomplete",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 21.sp,
                      color: AppColors.indigo,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "You are about to close this session. You will be redirected to login again.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.hintInfotextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  CustomTextButton(
                    title: "okay",
                    onPressed: () {
                      value.currentStep = OnboardingSteps.enter_mobile_number;
                      Navigator.pop(context);
                      Get.toNamed(Routes.SIGN_IN_MOBILE);
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
}
