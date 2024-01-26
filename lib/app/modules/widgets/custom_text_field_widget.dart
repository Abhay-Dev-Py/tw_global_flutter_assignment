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
