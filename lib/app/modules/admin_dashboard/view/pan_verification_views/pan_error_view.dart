import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/model/pan_error_model.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:get/get.dart';

class PanErrorView extends StatefulWidget {
  const PanErrorView({Key? key}) : super(key: key);

  @override
  State<PanErrorView> createState() => _PanErrorViewState();
}

class _PanErrorViewState extends State<PanErrorView> {
  late PanErrorModel errorModel;

  @override
  void initState() {
    errorModel = Get.arguments as PanErrorModel? ??
        generatePanErrorModel(PanErrorCodes.you_can_not_proceed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 116.h),
          Image.asset(
            AppAssets.pngs.dashboardPanError,
          ),
          SizedBox(height: 60.h),
          Text(
            errorModel.errorTitle,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.indigo,
              fontSize: 28.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Text(
            errorModel.errorDescription,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.hintInfotextColor,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Column(
            children: [
              CustomTextButton(
                title: errorModel.errorCode == PanErrorCodes.you_can_not_proceed
                    ? "okay"
                    : "retry",
                onPressed: () {},
              ),
              SizedBox(height: 22.h),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Have issues? ",
                        style: TextStyle(
                          color: AppColors.hintInfotextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "submit a ticket",
                        style: AppTextStyle.regularStyle.copyWith(
                          color: AppColors.blue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
