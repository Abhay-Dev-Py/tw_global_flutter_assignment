import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
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
          AppAssets.pngs.dashboardDocumentFail,
        ),
        SizedBox(height: 16.h),
        Text(
          "Upload IIBF Certificate",
          style: AppTextStyle.headline6.copyWith(
            fontSize: Dimens.fontSize22,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Complete sign up now",
          style: AppTextStyle.body2,
        ),
        SizedBox(height: 8.h),
        CustomTextButton(
          title: "upload now",
          onPressed: () {
            Get.toNamed(Routes.ONBOARDING_CERTIFICATE_DETAILS);
          },
          buttonWidth: 118.w,
          height: 22.h,
        ),
      ],
    );
  }
}
