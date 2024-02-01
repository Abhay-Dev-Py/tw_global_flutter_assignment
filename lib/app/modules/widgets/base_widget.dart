import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/values/app_colors.dart';
import 'package:flutter_getx_template/app/data/interface_controller/api_interface_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_retry_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

export 'package:flutter_getx_template/app/common/util/exports.dart';

class BaseWidget extends StatelessWidget {
  ///A widget with only custom retry button widget.
  final Widget child;

  const BaseWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiInterfaceController>(
      builder: (c) => Stack(
        children: [
          Positioned.fill(
            child: child,
          ),
          Visibility(
            visible: c.retry != null && c.error != null,
            child: Positioned.fill(
              child: Scaffold(
                body: CustomRetryWidget(
                  onPressed: c.onRetryTap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Column titleSubtitleWidget({
  required String title,
  required String subtitle,
  Widget? button,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: AppColors.lightActive,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: 8.h),
      Text(
        subtitle,
        style: TextStyle(
          color: AppColors.indigo,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      if (button != null) SizedBox(height: 8.h),
      if (button != null) button,
      SizedBox(height: 20.h),
    ],
  );
}

