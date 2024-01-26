import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AppScaffold extends StatefulWidget {
  final bool inAsyncCall;
  final AppBar? appBar;
  final Widget body;
  final Color backgroundColor;
  final Widget? bottomSheet;
  final double? bottomSheetHeight;
  final bool isBannerRequired;

  const AppScaffold({
    Key? key,
    this.inAsyncCall = false,
    this.appBar,
    required this.body,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.bottomSheet,
    this.bottomSheetHeight,
    this.isBannerRequired = false,
  }) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Theme.of(context).primaryColorDark,
        ),
        child: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: widget.inAsyncCall,
            child: Scaffold(
              appBar: widget.appBar,
              body: Stack(
                children: [
                  if (widget.isBannerRequired)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(AppAssets.pngs.signInPasscodeBanner),
                    ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
    );
  }
}
