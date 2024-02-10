import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PanReviewView extends StatefulWidget {
  const PanReviewView({Key? key}) : super(key: key);

  @override
  State<PanReviewView> createState() => _PanReviewViewState();
}

class _PanReviewViewState extends State<PanReviewView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDashboardProvider>(
      builder: (context, adminDashboardProvider, __) {
        return AppScaffold(
          isPaddingRequired: false,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 24.h,
              ),
            ),
          ),
          body: SizedBox(
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  height: 190.h,
                ),
                SizedBox(height: 28.h),
                Text(
                  "Review PAN image",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 21.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Text(
                    "Ensure the card details are placed inside the frame.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.hintInfotextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Text(
                    "You can drag box corners to adjust the image.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.hintInfotextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 34.h),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 32.h,
                        width: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.crop_rotate_rounded,
                            color: AppColors.blue,
                            size: 18.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        height: 32.h,
                        width: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.red,
                            size: 18.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Column(
            children: [
              CustomTextButton(
                title: "submit",
                onPressed: () {
                  Get.toNamed(Routes.PAN_SUBMIT_VIEW);
                },
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "retake",
                  style: AppTextStyle.lightStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.blue,
                  ),
                ),
              ),
            ],
          ),
          bottomSheetHeight: 100.h,
        );
      },
    );
  }
}
