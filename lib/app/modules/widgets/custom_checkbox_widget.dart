import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/validators.dart';

class CustomCheckboxWidget extends FormField<bool> {
  CustomCheckboxWidget({
    Key? key,
    required bool value,
    required FormFieldSetter<bool> onSaved,
    required Widget titleWidget,
  }) : super(
          key: key,
          initialValue: value,
          onSaved: onSaved,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (v) => AppValidators.validateCheckbox(v: v!),
          builder: (state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Checkbox(
                    value: state.value,
                    onChanged: state.didChange,
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      titleWidget,
                      // if (state.hasError)
                      //   Builder(
                      //     builder: (_) => Text(
                      //       state.errorText!,
                      //       style:
                      //           TextStyle(color: Theme.of(_).colorScheme.error),
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
}
