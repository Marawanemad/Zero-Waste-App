import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/text_form_field.dart';

Widget ProfileFormField({
  required hintText,
  bool? obscureText,
  required keyboardType,
  required text_input_action,
  required controller,
  required validationMessage,
  required prefixIcon,
  required context,
  suffixIcon,
  suffixIconPressed,
  onSubmit,
  focusNode,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5, right: 40),
    child: formField(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      prefixIcon: prefixIcon,
      suffixPressed: suffixIconPressed,
      suffixIcon: suffixIcon,
      controller: controller,
      keyboardType: keyboardType,
      text_input_action: text_input_action,
      obscureText: obscureText,
      FormBorderShape: InputBorder.none,
      focusBorderShape: InputBorder.none,
      hintText: hintText,
      hintStyle: CustomTextStyle.medium14.responsive(context),
      validationMessage: validationMessage,
      onSubmit: onSubmit,
      focusNode: focusNode,
    ),
  );
}
