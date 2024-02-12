import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/providers/help_desk_provider.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_containter_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HelpDeskView extends StatefulWidget {
  const HelpDeskView({Key? key}) : super(key: key);

  @override
  State<HelpDeskView> createState() => _HelpDeskViewState();
}

class _HelpDeskViewState extends State<HelpDeskView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HelpDeskProvider>(
      builder: (context, provider, __) {
        return AppScaffold(
          isBannerRequired: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 24.h,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Submit a Ticket",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 21.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Please tell us your issue and  our team will get back to you within 24 hours",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.hintInfotextColor,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Select Issue type",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.indigo,
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 140.h,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 2.w,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      bool isContainerSelected =
                          provider.selectedIssue == index;
                      return GestureDetector(
                        onTap: () {
                          provider.selectedIssue = index == 3 ? -1 : index;
                        },
                        child: CustomContainer(
                          containerColor: index == 3
                              ? Colors.transparent
                              : isContainerSelected
                                  ? AppColors.lightBlue
                                  : AppColors.white,
                          borderColor: isContainerSelected
                              ? AppColors.blue
                              : AppColors.lightBlue,
                          child: Center(
                            child: index == 3
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 18.w,
                                      vertical: 16.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "view more",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Icon(
                                          Icons.arrow_downward_outlined,
                                        ),
                                      ],
                                    ),
                                  )
                                : Text(
                                    provider.issueType[index],
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: isContainerSelected
                                          ? AppColors.blue
                                          : null,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CustomTextFieldWidget(
                  labelText: "Subject",
                  hintText: "eg. Not able to complete PAN verification",
                  controller: provider.ticketSubjectController,
                  onChanged: (updatedText) {
                    provider.setTicketSubjectControllerValue =
                        updatedText ?? "";
                  },
                  validator: (value) => AppValidators.validateEmpty(value),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 12.h),
                CustomTextFieldWidget(
                  labelText: "Your message",
                  hintText: "Issue message goes here",
                  // controller: provider.ticketSubjectController,
                  // onChanged: (updatedText) {
                  //   provider.setTicketSubjectControllerValue = updatedText ?? "";
                  // },
                  validator: (value) => AppValidators.validateEmpty(value),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 144.h),
              ],
            ),
          ),
          bottomSheet: Column(
            children: [
              CustomTextButton(
                title: "submit",
                onPressed: () {},
              ),
              SizedBox(height: 22.h),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "call us at ",
                        style: TextStyle(
                          color: AppColors.hintInfotextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "70393 25849",
                        style: AppTextStyle.regularStyle.copyWith(
                          color: AppColors.blue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomSheetHeight: 100.h,
        );
      },
    );
  }
}
