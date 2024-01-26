
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.red,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 10.r,
                backgroundColor: AppColors.white,
                child: const Icon(
                  Icons.arrow_right_alt_rounded,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Santosh",
              style: AppTextStyle.headline6,
            ),
            const MyText(
              title: "KYC Point, HSR Layout",
              color: AppColors.hintInfotextColor,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.lightBlue,
          child: Icon(
            Icons.notifications_outlined,
            size: 20.h,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
