import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_containter_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingScheduleOfflineVerificationView extends StatefulWidget {
  const OnboardingScheduleOfflineVerificationView({Key? key}) : super(key: key);

  @override
  State<OnboardingScheduleOfflineVerificationView> createState() =>
      _OnboardingEmailAddressViewState();
}

class _OnboardingEmailAddressViewState
    extends State<OnboardingScheduleOfflineVerificationView> {
  bool isFromDashboard = false;
  @override
  void initState() {
    isFromDashboard = Get.arguments as bool? ?? false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OnboardingProvider>(context, listen: false)
          .generateDateList();
      Provider.of<OnboardingProvider>(context, listen: false)
          .generateTimeSlots();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, value, __) {
        return AppScaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                isFromDashboard
                    ? "Modify offline verification"
                    : "Schedule offline verification",
                style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                isFromDashboard
                    ? "Please select a time slot to update"
                    : "Please select a time slot",
                style: AppTextStyle.lightStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 20.h),
              detailHeading("What day?"),
              SizedBox(height: 12.h),
              DayListWidget(value: value),
              SizedBox(height: 20.h),
              detailHeading("What time?"),
              SizedBox(height: 12.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0.w,
                    mainAxisSpacing: 12.0.h,
                    childAspectRatio: 1.8,
                  ),
                  itemCount: value.getTimeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        value.setSelectedTimeIndex = index;
                      },
                      child: CustomContainer(
                        borderColor: value.getSelectedTimeIndex == index
                            ? AppColors.blue
                            : AppColors.lightBlue,
                        containerColor: value.getSelectedTimeIndex == index
                            ? AppColors.lightBlue
                            : AppColors.white,
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Center(
                          child: MyText(
                            title: value.getTimeList[index],
                            color: value.getSelectedTimeIndex == index
                                ? AppColors.blue
                                : AppColors.indigo,
                            size: 14.sp,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
          bottomSheet: CustomTextButton(
            title: "confirm",
            onPressed: () {
              if (isFromDashboard) {
                Get.back(result: "Updated time");
                return;
              }
              value.currentStep = OnboardingSteps.all_set;
              Get.toNamed(Routes.ONBOARDING_SUCCESS);
            },
          ),
        );
      },
    );
  }
}

class DayListWidget extends StatelessWidget {
  final OnboardingProvider value;
  const DayListWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        itemCount: value.getDateList.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              value.setSelectedDayIndex = index;
            },
            child: CustomContainer(
              borderColor: value.getSelectedDayIndex == index
                  ? AppColors.blue
                  : AppColors.lightBlue,
              containerColor: value.getSelectedDayIndex == index
                  ? AppColors.lightBlue
                  : AppColors.white,
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              margin: index == 0
                  ? EdgeInsets.only(right: 12.w)
                  : EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    title: value.getDateList[index]['day'],
                    color: value.getSelectedDayIndex == index
                        ? AppColors.blue
                        : AppColors.indigo,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    value.getDateList[index]['date'],
                    style: AppTextStyle.lightStyle.copyWith(
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
