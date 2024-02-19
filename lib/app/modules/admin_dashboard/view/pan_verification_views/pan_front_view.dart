import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PanFrontView extends StatefulWidget {
  const PanFrontView({Key? key}) : super(key: key);

  @override
  State<PanFrontView> createState() => _PanFrontViewState();
}

class _PanFrontViewState extends State<PanFrontView> {
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
                  "Front of PAN",
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
                    "Ensure a clear image of the entire PAN card, including your signature, is captured for display. Then tap the shutter.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.hintInfotextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 34.h),
                Container(
                  height: 32.h,
                  width: 32.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.flash_on_rounded,
                      color: AppColors.blue,
                      size: 18.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.PAN_REVIEW_VIEW);
            },
            child: Container(
              height: 74.h,
              width: 74.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 201, 221, 251),
              ),
              child: Center(
                child: Container(
                  height: 40.h,
                  width: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blue,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}