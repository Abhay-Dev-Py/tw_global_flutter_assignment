import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';
import 'custom_containter_widget.dart';
import 'custom_country_picker_widget.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? labelText, hintText;
  final String? initialValue, prefixText, suffixText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final int? maxLength, maxLines;
  final int minLines;
  final bool readOnly, addHint, enabled;
  final bool? isDense;
  final Function()? onTap;
  final InputBorder? border;
  final AutovalidateMode autovalidateMode;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? prefixIconPadding;
  final Color? fillColor;
  final bool showValidation;
  final String? errorText;
  final TextFeildType textFeildType;
  final bool obsecureText;

  const CustomTextFieldWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator = AppValidators.validateEmpty,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.maxLines,
    this.minLines = 1,
    this.initialValue,
    this.readOnly = false,
    this.onTap,
    this.border,
    this.enabled = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.addHint = false,
    this.suffixIconConstraints,
    this.prefixText,
    this.suffixText,
    this.isDense,
    this.prefixIconPadding,
    this.fillColor,
    this.showValidation = false,
    this.errorText,
    this.textFeildType = TextFeildType.text,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      type: textFeildType,
      borderColor: AppColors.lightBlue,
      prefix:
          TextFeildType.text == textFeildType ? null : const CountryPickerUI(),
      labelText: Align(
        alignment: Alignment.topLeft,
        child: MyText(
          color: AppColors.hintInfotextColor,
          title: labelText ??
              (TextFeildType.text == textFeildType
                  ? "Enter email"
                  : "Enter phone number"),
          size: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      inputField: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        initialValue: initialValue,
        keyboardType: keyboardType,
        autovalidateMode: autovalidateMode,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        minLines: minLines,
        maxLines: obsecureText ? 1 : maxLines,
        onSaved: onSaved,
        enabled: enabled,
        obscureText: obsecureText,
        inputFormatters: maxLength == null
            ? null
            : [
                LengthLimitingTextInputFormatter(maxLength),
                if (keyboardType == TextInputType.number ||
                    keyboardType == TextInputType.phone)
                  FilteringTextInputFormatter.digitsOnly,
              ],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 0),
          counterText: "",
          border: InputBorder.none,
          hintText: hintText,
          errorText: showValidation ? errorText : null,
          errorMaxLines: 3,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
        ),
      ),
    );
  }
}

class CustomOtpWidget extends StatefulWidget {
  const CustomOtpWidget({Key? key}) : super(key: key);

  @override
  State<CustomOtpWidget> createState() => _CustomOtpWidgetState();
}

class _CustomOtpWidgetState extends State<CustomOtpWidget> {
  final List<String> _otpNumberList = List.generate(6, (index) => "-");

  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty && i < 5) {
          FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
        } else if (_controllers[i].text.isEmpty && i > 0) {
          FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        _otpNumberList.length,
        (index) => Container(
          height: 40.h,
          width: 44.w,
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.r,
                color: AppColors.lightBlue,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Center(
            child: TextFormField(
              controller: _controllers[index],
              decoration: const InputDecoration(
                hintText: "  -",
                counterText: "",
              ),
              onChanged: (_) {
                // RegExp r = RegExp(r'^[^0-9]*([0-9]){1}[^0-9]*$');
                // if (r.hasMatch(_)) {
                //   _otpNumberControllerList[index].text = "  $_";
                // }
              },
              maxLength: 1,
              keyboardType: TextInputType.number,
              focusNode: _focusNodes[index],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
