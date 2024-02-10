import 'package:flutter/widgets.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';

class RoleSwitchWidget extends StatelessWidget {
  final bool isSelected;
  final String role;
  final Function onPressed;
  final double? width;
  final TextStyle? style;
  final bool isHighlighted;
  const RoleSwitchWidget({
    Key? key,
    required this.isSelected,
    required this.role,
    required this.onPressed,
    this.width,
    this.style,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(role),
      child: Container(
        height: 34.h,
        width: width ?? 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.r),
          color: isSelected ? AppColors.indigo : AppColors.white,
          border: Border.all(
            color: isHighlighted ? AppColors.blue : AppColors.white,
          ),
        ),
        child: Center(
          child: Text(
            role,
            style: style ??
                (isSelected
                    ? AppTextStyle.semiBoldStyle.copyWith(
                        color: AppColors.white,
                        fontSize: 16.sp,
                      )
                    : AppTextStyle.regularStyle.copyWith(
                        color:
                            isHighlighted ? AppColors.blue : AppColors.indigo,
                        fontSize: 16.sp,
                      )),
          ),
        ),
      ),
    );
  }
}
