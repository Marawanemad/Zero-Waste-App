import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/text_form_field.dart';

Widget AuthFormField({
  required hintText,
  bool? obscureText,
  focusNode,
  onSubmit,
  required keyboardType,
  required text_input_action,
  required controller,
  required bool showErrorIcon,
  required String validationMessage,
}) {
  return Stack(
    alignment: Alignment.centerRight,
    children: [
      Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: CustomColors.greyF3,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 5, bottom: 20),
          child: formField(
              controller: controller,
              focusNode: focusNode,
              onSubmit: onSubmit,
              keyboardType: keyboardType,
              text_input_action: text_input_action,
              obscureText: obscureText,
              FormBorderShape: InputBorder.none,
              focusBorderShape: InputBorder.none,
              hintText: hintText,
              hintStyle: CustomTextStyle.regular12
                  .copyWith(color: CustomColors.grey61, fontSize: 16),
              validationMessage: validationMessage),
        ),
      ),
      showErrorIcon == true
          ? const Positioned(
              right: 35,
              child: Icon(Icons.info_outline_rounded, color: Colors.red))
          : const SizedBox(),
    ],
  );
}
