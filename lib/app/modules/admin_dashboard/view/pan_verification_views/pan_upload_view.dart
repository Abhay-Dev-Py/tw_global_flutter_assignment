import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PanUploadView extends StatefulWidget {
  const PanUploadView({Key? key}) : super(key: key);

  @override
  State<PanUploadView> createState() => _PanUploadViewState();
}

class _PanUploadViewState extends State<PanUploadView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDashboardProvider>(
      builder: (context, adminDashboardProvider, __) {
        return AppScaffold(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PAN verification",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 21.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Upload the front side of agent's PAN card",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 128.h),
                Center(
                  child: SizedBox(
                    child: Image.asset(
                      AppAssets.pngs.dashboardPanVerifyPlaceholder,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Spacer(),
                CustomTextButton(
                  title: "capture front of PAN",
                  onPressed: () {
                    // go to front Pan view
                    Get.toNamed(Routes.PAN_FRONT_VIEW);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
