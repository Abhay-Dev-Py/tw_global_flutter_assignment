import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';

//custom widget background container for signup and signIn
class CustomContainer extends StatelessWidget {
  final Color containerColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  final double? height;
  final double? width;
  const CustomContainer({
    Key? key,
    this.margin,
    this.padding,
    this.containerColor = AppColors.white,
    required this.child,
    this.borderColor = Colors.transparent,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(3.0),
      margin: margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.5.w),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: containerColor,
      ),
      child: child,
    );
  }
}

//custom widget container which has textfield inside

class TextFieldContainer extends StatelessWidget {
  final Color borderColor;
  final Widget labelText;
  final Widget inputField;
  final Widget? prefix;
  final Widget? suffix;
  final TextFeildType type;
  const TextFieldContainer({
    Key? key,
    required this.borderColor,
    required this.labelText,
    required this.inputField,
    this.prefix,
    this.suffix,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.4),
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: TextFeildType.mobile == type,
              maintainSize: false,
              child: prefix ?? Container(),
            ),
            Visibility(
              visible: TextFeildType.mobile == type,
              maintainSize: false,
              child: Container(
                width: 0.1, // Adjust the width of the vertical divider
                height: mediaQuery.size.height *
                    0.1, // Occupies the full height available
                color: Colors.black, // Color of the vertical divider
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ), // Adjust the horizontal spacing
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: mediaQuery.size.height * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [labelText, inputField],
                ),
              ),
            ),
            Visibility(
              visible: TextFeildType.password == type,
              maintainSize: false,
              child: suffix ?? Container(),
            ),
          ],
        ),
      ),
    );
  }
}
