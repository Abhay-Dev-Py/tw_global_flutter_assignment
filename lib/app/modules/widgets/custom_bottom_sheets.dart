import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void showBottomsheet({
  required BuildContext context,
  required Widget content,
  bool showCloseButton = true,
  double? closeButtonheight,
}) {
  // final context = AppNavigation.navigatorKey.currentState!.context;
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry? overlayEntry;
  if (showCloseButton) {
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: closeButtonheight ?? 0.65.sh,
          right: 16.0,
          child: GestureDetector(
            onTap: () {
              // overlayEntry!.remove();
              Navigator.pop(context);
            },
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: const Icon(
                Icons.close_rounded,
                color: AppColors.indigo,
                size: 20.0,
              ),
            ),
          ),
        );
      },
    );
  }

  showModalBottomSheet(
    isDismissible: false,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
    ),
    backgroundColor: AppColors.lightGrey,
    isScrollControlled: true,
    enableDrag: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, state) {
          //if issue remove this singchild scrollview
          return SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  content,
                ],
              ),
            ),
          );
        },
      );
    },
  ).whenComplete(() {
    if (showCloseButton && overlayEntry != null) {
      overlayEntry.remove();
    }
  });

  if (showCloseButton && overlayEntry != null) {
    overlayState.insert(overlayEntry);
  }
}

void showRejectionDialog({
  required BuildContext context,
}) {
  showBottomsheet(
    context: context,
    content: _rejectionSheetProfile(provider: null),
    showCloseButton: true,
    closeButtonheight: 0.40.sh,
  );
}

Widget _rejectionSheetProfile({required dynamic provider}) {
  return Consumer(
    builder: (context, value, __) {
      return SizedBox(
        height: 0.555.sh,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.05.sw,
            vertical: 0.03.sh,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.pngs.commonSpeaker,
                  height: 72.h,
                ),
                SizedBox(height: 12.h),
                Text(
                  "Are you sure?",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 21.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "You are about to reject this field visit, please specify your reason to proceed.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.hintInfotextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                CustomTextFieldWidget(
                  labelText: "Enter reason",
                  hintText: "eg. Could not locate the shop",
                  // controller: value.rejectReasonController,
                  // onChanged: (updatedText) {
                  //   value.setRejectReasonControllerValue = updatedText ?? "";
                  // },
                  validator: (value) => AppValidators.validateEmpty(value),
                  keyboardType: TextInputType.text,
                ),
                const Spacer(),
                CustomTextButton(
                  title: "confirm",
                  onPressed:
                      // AppValidators.validateEmpty(
                      //           value.rejectReasonController.text,
                      //         ) !=
                      //         null
                      //     ? null
                      //     :
                      () {
                    Navigator.pop(context);
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
