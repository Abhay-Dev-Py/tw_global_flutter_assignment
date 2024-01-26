import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';

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
