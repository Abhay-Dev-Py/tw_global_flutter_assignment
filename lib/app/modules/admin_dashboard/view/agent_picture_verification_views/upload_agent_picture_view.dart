import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UploadAgentPictureView extends StatefulWidget {
  const UploadAgentPictureView({Key? key}) : super(key: key);

  @override
  State<UploadAgentPictureView> createState() => _UploadAgentPictureViewState();
}

class _UploadAgentPictureViewState extends State<UploadAgentPictureView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDashboardProvider>(
      builder: (context, adminDashboardProvider, __) {
        return AppScaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 24.h,
                ),
              ),
            ),
          ),
          body: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify Agent Photograph",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Make sure your face fits the frame and avoid any background distractions",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.hintInfotextColor,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 40.h),
                Container(
                  color: Colors.red,
                  height: 190.h,
                ),
                SizedBox(height: 28.h),
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
