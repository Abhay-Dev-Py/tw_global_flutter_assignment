import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
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
            style: AppTextStyle.headline6.copyWith(
              fontSize: Dimens.fontSize22,
            ),
          ),
          if (!isAdminAssigned)
            Text(
              "Soon an admin will be assigned to for offline verification.",
              style: AppTextStyle.body2,
            ),
          if (!isAdminAssigned) SizedBox(height: 32.h),
          Text(
            "Please keep the following documents ready for verification",
            style: AppTextStyle.body2,
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
                        AppAssets.pngs.dashboardDocumentFail,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const Text("PAN Card"),
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
                        AppAssets.pngs.dashboardDocumentFail,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const Text("Aadhar Card"),
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
                        AppAssets.pngs.dashboardDocumentFail,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const Text("IIBF Certificate"),
                ],
              ),
            ],
          ),
          SizedBox(height: 32.h),
          if (isAdminAssigned)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ADMIN NAME",
                  style: AppTextStyle.body2,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Komal Singhania",
                  style: AppTextStyle.headline6.copyWith(
                    fontSize: Dimens.fontSize22,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          if (isAdminAssigned)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MOBILE NUMBER",
                  style: AppTextStyle.body2,
                ),
                SizedBox(height: 8.h),
                Text(
                  "9230929392",
                  style: AppTextStyle.headline6.copyWith(
                    fontSize: Dimens.fontSize22,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
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
                SizedBox(height: 20.h),
              ],
            ),
          Text(
            isAdminAssigned
                ? "DATE AND TIME"
                : "Selected date for time and verification",
            style: AppTextStyle.body2,
          ),
          SizedBox(height: 8.h),
          Text(
            "Tomorrow 22 Sep, 12:30 AM",
            style: AppTextStyle.headline6.copyWith(
              fontSize: Dimens.fontSize22,
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
                  const Icon(
                    Icons.edit,
                    color: AppColors.blue,
                  ),
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
