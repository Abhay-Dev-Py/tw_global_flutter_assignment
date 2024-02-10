import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/widgets/base_widget.dart';

class VerificationStarted extends StatelessWidget {
  const VerificationStarted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 26.h),
          Text(
            "Your verification has started",
            style: TextStyle(
              color: AppColors.indigo,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 12.h),
          titleSubtitleWidget(
            title: "VISITOR NAME",
            subtitle: "Komal Sinhania",
          ),
          titleSubtitleWidget(
            title: "MOBILE NUMBER",
            subtitle: "9230929392",
            button: Container(
              width: 76.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(
                  12.r,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 12.w,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.call,
                    color: AppColors.blue,
                  ),
                  Text(
                    " call",
                    style: AppTextStyle.regularStyle.copyWith(
                      color: AppColors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // titleSubtitleWidget(
          //   title: "DATE AND TIME",
          //   subtitle: "Tomorrow 22 Sep, 12:30 AM",
          //   button: GestureDetector(
          //     onTap: () {
          //       Get.toNamed(
          //         Routes.ONBOARDING_SCHEDULE_OFFLINE_VERIFICATION,
          //         arguments: true,
          //       )?.then((value) {
          //         // fetch the updated date time from here and make API call
          //       });
          //     },
          //     child: Container(
          //       width: 76.w,
          //       height: 36.h,
          //       decoration: BoxDecoration(
          //         color: AppColors.white,
          //         borderRadius: BorderRadius.circular(
          //           12.r,
          //         ),
          //       ),
          //       padding: EdgeInsets.symmetric(
          //         vertical: 8.h,
          //         horizontal: 12.w,
          //       ),
          //       child: Row(
          //         children: [
          //           Image.asset(AppAssets.pngs.commonEdit),
          //           Text(
          //             " edit",
          //             style: AppTextStyle.regularStyle.copyWith(
          //               color: AppColors.blue,
          //               fontSize: 14.sp,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 8.h),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
