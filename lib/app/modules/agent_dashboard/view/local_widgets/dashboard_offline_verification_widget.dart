import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/widgets/base_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OfflineVerification extends StatelessWidget {
  final bool isAdminAssigned;
  const OfflineVerification({
    Key? key,
    required this.isAdminAssigned,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 26.h),
          Text(
            "Complete offline verification",
            style: TextStyle(
              color: AppColors.indigo,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (!isAdminAssigned)
            Text(
              "Soon an admin will be assigned to for offline verification.",
              style: TextStyle(
                color: AppColors.indigo,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          if (!isAdminAssigned) SizedBox(height: 32.h),
          Text(
            "Please keep the following documents ready for verification",
            style: TextStyle(
              color: AppColors.indigo,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                    width: 38.h,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        AppAssets.pngs.dashboardPanPlaceholder,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "PAN Card",
                    style: TextStyle(
                      color: AppColors.indigo,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                    width: 38.h,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        AppAssets.pngs.dashboardAadhaarPlaceholder,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Aadhar Card",
                    style: TextStyle(
                      color: AppColors.indigo,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                    width: 38.h,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        AppAssets.pngs.dashboardCertificatePlaceholder,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "IIBF Certificate",
                    style: TextStyle(
                      color: AppColors.indigo,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 32.h),
          if (isAdminAssigned)
            titleSubtitleWidget(
              title: "ADMIN NAME",
              subtitle: "Komal Sinhania",
            ),
          if (isAdminAssigned)
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
          Text(
            isAdminAssigned
                ? "DATE AND TIME"
                : "Selected date for time and verification",
            style: TextStyle(
              color: AppColors.hintInfotextColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Tomorrow 22 Sep, 12:30 AM",
            style: TextStyle(
              color: AppColors.indigo,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.ONBOARDING_SCHEDULE_OFFLINE_VERIFICATION,
                arguments: true,
              )?.then((value) {
                // fetch the updated date time from here and make API call
              });
            },
            child: Container(
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
                  Image.asset(AppAssets.pngs.commonEdit),
                  Text(
                    " edit",
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
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
