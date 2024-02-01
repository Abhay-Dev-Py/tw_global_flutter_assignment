import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isNotificationBellRequired;
  const DashboardHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isNotificationBellRequired = true,
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
                child: SvgPicture.asset(AppAssets.svgs.threeLineColumnSvg),
              ),
            ),
          ],
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.indigo,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.hintInfotextColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        if(isNotificationBellRequired) const Spacer(),
       if(isNotificationBellRequired) CircleAvatar(
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
