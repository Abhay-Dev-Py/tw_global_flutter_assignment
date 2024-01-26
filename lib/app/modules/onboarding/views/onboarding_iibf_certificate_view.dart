import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/media_utils.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_bottom_sheets.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_checkbox_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_rich_text_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class OnboardingIIBFCertificateDetailsView extends StatefulWidget {
  const OnboardingIIBFCertificateDetailsView({Key? key}) : super(key: key);

  @override
  State<OnboardingIIBFCertificateDetailsView> createState() =>
      _OnboardingIIBFCertificateDetailsViewState();
}

class _OnboardingIIBFCertificateDetailsViewState
    extends State<OnboardingIIBFCertificateDetailsView> {
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
                "IIBF certification",
                style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                "Please enter the details as per your IIBF Certificate information",
                style: AppTextStyle.lightStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextFieldWidget(
                labelText: "Your IIBF registration number",
                controller: value.registrationNumberController,
                onChanged: (updatedText) {
                  value.setRegistrationNumberControllerValue =
                      updatedText?.toUpperCase() ?? "";
                },
                validator: (value) =>
                    AppValidators.validateIIBFRegistrationNumber(value),
                maxLength: 20,
              ),
              SizedBox(height: 10.h),
              CustomTextFieldWidget(
                labelText: "Serial number",
                controller: value.serialNumberController,
                onChanged: (updatedText) {
                  value.setSerialNumberController =
                      updatedText?.toUpperCase() ?? "";
                },
                validator: (value) => AppValidators.validateIIBFSerial(value),
              ),
              SizedBox(height: 10.h),
              CustomTextFieldWidget(
                labelText: "Date of certificate issue",
                controller: value.dateOfCertificateIssueController,
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ) ??
                      DateTime.now();

                  value.setDateOfCertificateIssueControllerValue =
                      date.toIso8601String();
                },
                validator: (value) => AppValidators.validateEmpty(value),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrey, width: 1.4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                  color: AppColors.white,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.svgs.attachmentPinSvg,
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "IIBF certificate photo",
                          style: GoogleFonts.manrope(
                            color: AppColors.hintInfotextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    // const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showBottomsheet(
                          context: context,
                          content: sheetProfile(),
                          showCloseButton: true,
                        );
                      },
                      child: Text(
                        "upload",
                        style: AppTextStyle.lightStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomSheet: Column(
            children: [
              CustomCheckboxWidget(
                titleWidget: CustomRichTextWidget(
                  title: "I accept ",
                  titleStyle: AppTextStyle.lightStyle.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 14.sp,
                  ),
                  subtitle: "terms and conditions",
                  subtitleStyle: AppTextStyle.regularStyle.copyWith(
                    color: AppColors.blue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                value: value.getIsTnCAccepted,
                onSaved: (newValue) {
                  value.setIsTnCAccepted = newValue ?? false;
                },
              ),
              Column(
                children: [
                  CustomTextButton(
                    title: "proceed",
                    onPressed: (AppValidators.validateIIBFRegistrationNumber(
                                  value.registrationNumberController.text,
                                ) !=
                                null ||
                            AppValidators.validateIIBFSerial(
                                  value.serialNumberController.text,
                                ) !=
                                null)
                        ? null
                        : () {
                            // set certificate uploaded to true,
                            Provider.of<DashboardProvider>(
                              context,
                              listen: false,
                            ).isCertificateUploaded = true;
                            value.currentStep = OnboardingSteps.review_details;
                            Get.toNamed(Routes.ONBOARDING_REVIEW_DETAILS);
                          },
                  ),
                  SizedBox(height: 20.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have the certificate? ",
                          style: AppTextStyle.lightStyle.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: "add later",
                          style: AppTextStyle.regularStyle.copyWith(
                            color: AppColors.blue,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offAndToNamed(Routes.AGENT_DASHBOARD);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomSheetHeight: 130.h,
        );
      },
    );
  }

  SizedBox sheetProfile({
    bool isPhoto = true,
  }) {
    bool isloading = false;
    return SizedBox(
      height: 0.30.sh,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.05.sw,
          vertical: 0.03.sh,
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: MyText(
                title: "Upload IIBF certificate photo",
                color: AppColors.indigo,
                fontWeight: FontWeight.w800,
                size: 21,
              ),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side:
                      const BorderSide(width: 0.50, color: AppColors.lightBlue),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: (isloading)
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          buildMenuItem(
                            // Assets.assets_mini_modules_take_photo_png,
                            SvgPicture.asset(
                              AppAssets.svgs.cameraSvg,
                            ),
                            "Take a photo",
                            () => AppMediaUtils.pickImage(ImageSource.camera),
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.lightGrey,
                          ),
                          buildMenuItem(
                            // Assets.assets_mini_modules_select_photo_png,
                            SvgPicture.asset(
                              AppAssets.svgs.selectPhotoSvg,
                            ),
                            "Select a photo",
                            () => AppMediaUtils.pickImage(ImageSource.gallery),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(Widget icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 8,
                ),
                MyText(
                  title: label,
                  color: AppColors.indigo,
                  size: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SvgPicture.asset(
              AppAssets.svgs.arrowRightSvg,
            ),
          ],
        ),
      ),
    );
  }
}
