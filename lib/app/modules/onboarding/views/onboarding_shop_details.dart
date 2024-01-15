import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingShopDetailsView extends StatefulWidget {
  const OnboardingShopDetailsView({Key? key}) : super(key: key);

  @override
  State<OnboardingShopDetailsView> createState() =>
      _OnboardingShopDetailsViewState();
}

class _OnboardingShopDetailsViewState extends State<OnboardingShopDetailsView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            "Shop details",
            style: AppTextStyle.boldStyle.copyWith(fontSize: 28.sp),
          ),
          SizedBox(height: 8.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, _) {
              return Text(
                "Please share your shop's address, this address can be your home address",
                style: AppTextStyle.lightStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, _) {
              return CustomTextFieldWidget(
                labelText: "Your shop name",
                controller: value.shopNameController,
                onChanged: (updatedText) {
                  value.setShopNameControllerValue = updatedText ?? "";
                },
                validator: (value) => AppValidators.validateEmpty(value),
                maxLength: 20,
              );
            },
          ),
          SizedBox(height: 10.h),
          Consumer<OnboardingProvider>(
            builder: (context, value, _) {
              return CustomTextFieldWidget(
                labelText: "Address",
                controller: value.shopAddressController,
                onChanged: (updatedText) {
                  value.setShopAddressControllerValue = updatedText ?? "";
                },
                validator: (value) => AppValidators.validateEmpty(value),
                maxLines: 5,
              );
            },
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Consumer<OnboardingProvider>(
                  builder: (context, value, _) {
                    return CustomTextFieldWidget(
                      labelText: "City",
                      controller: value.cityController,
                      onChanged: (updatedText) {
                        value.setCityControllerValue = updatedText ?? "";
                      },
                      validator: (value) => AppValidators.validateEmpty(value),
                      maxLength: 20,
                    );
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Consumer<OnboardingProvider>(
                  builder: (context, value, _) {
                    return CustomTextFieldWidget(
                      labelText: "State",
                      controller: value.stateController,
                      onChanged: (updatedText) {
                        value.setStateControllerValue = updatedText ?? "";
                      },
                      validator: (value) => AppValidators.validateEmpty(value),
                      maxLength: 20,
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Consumer<OnboardingProvider>(
                  builder: (context, value, _) {
                    return CustomTextFieldWidget(
                      labelText: "Country",
                      controller: value.countryController,
                      onChanged: (updatedText) {
                        value.setCountryControllerValue = updatedText ?? "";
                      },
                      validator: (value) => AppValidators.validateEmpty(value),
                      maxLength: 20,
                    );
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Consumer<OnboardingProvider>(
                  builder: (context, value, _) {
                    return CustomTextFieldWidget(
                      labelText: "Pincode",
                      controller: value.pincodeController,
                      onChanged: (updatedText) {
                        value.setPincodeControllerValue = updatedText ?? "";
                      },
                      validator: (value) => AppValidators.validateEmpty(value),
                      maxLength: 8,
                      keyboardType: TextInputType.number,
                    );
                  },
                ),
              ),
            ],
          ),
          const Spacer(),
          Consumer<OnboardingProvider>(
            builder: (_, value, __) => Column(
              children: [
                CustomTextButton(
                  title: "proceed",
                  onPressed: () {
                    value.currentStep =
                        OnboardingSteps.enter_certificate_details;
                    Get.toNamed(Routes.ONBOARDING_CERTIFICATE_DETAILS);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
