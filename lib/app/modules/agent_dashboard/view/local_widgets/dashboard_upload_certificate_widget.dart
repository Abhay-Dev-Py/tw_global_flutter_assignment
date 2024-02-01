import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class UploadCertificate extends StatelessWidget {
  const UploadCertificate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 120.h),
        Image.asset(
          AppAssets.pngs.dashboardDocument,
        ),
        SizedBox(height: 16.h),
        Text(
          "Upload IIBF Certificate",
          style: TextStyle(
            color: AppColors.indigo,
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Complete sign up now",
          style: TextStyle(
            color: AppColors.indigo,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.ONBOARDING_CERTIFICATE_DETAILS);
          },
          child: Container(
            width: 118.w,
            height: 28.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'upload now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
