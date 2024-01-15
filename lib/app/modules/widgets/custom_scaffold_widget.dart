import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AppScaffold extends StatefulWidget {
  final bool inAsyncCall;
  final AppBar? appBar;
  final Widget body;
  final Color backgroundColor;
  final List<Widget>? persistentFooterButtons;

  const AppScaffold({
    Key? key,
    this.inAsyncCall = false,
    this.appBar,
    required this.body,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.persistentFooterButtons,
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
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: widget.body,
              ),
              backgroundColor: widget.backgroundColor,
              persistentFooterButtons: widget.persistentFooterButtons,
            ),
          ),
        ),
      ),
    );
  }
}
