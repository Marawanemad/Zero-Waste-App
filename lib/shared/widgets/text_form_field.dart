import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';

// to make text form field to reuse it
formField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  String? labelText,
  TextStyle? labelStyle,
  String? hintText,
  TextStyle? hintStyle,
  prefixIcon,
  suffixIcon,
  suffixPressed,
  bool? obscureText,
  String? validationMessage,
  TextInputAction? text_input_action,
  void Function(String)? onSubmit,
  InputBorder? FormBorderShape,
  InputBorder? focusBorderShape,
  double circularBorder = 8,
  Color? prefixIconColor,
  Color? BorderColor,
  Color? CursorColor,
  padding,
  focusNode,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 7.0),
    child: TextFormField(
      // to can focus on any other field when submit
      focusNode: focusNode,
      maxLines: keyboardType == TextInputType.multiline ? null : 1,
      obscureText: obscureText ?? false,
      controller: controller,
      // to make action when click on keyboard submit
      textInputAction: text_input_action,
      decoration: InputDecoration(
        prefix: const SizedBox(width: 10),
        // text appear in box and when you pressed on it move to up and don't disappear
        labelText: labelText,
        labelStyle: labelStyle ?? const TextStyle(color: Colors.black),
        // word appear when pressed on box and disappeared when user write
        hintText: hintText,
        hintStyle: hintStyle,
        // to put icon in the start of box
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor ?? Colors.black,
        suffixIcon: suffixPressed != null
            ? Padding(
                padding: padding ?? const EdgeInsets.all(0),
                child: IconButton(onPressed: suffixPressed, icon: suffixIcon),
              )
            : suffixIcon,
        // use to make shape when not select the form field
        enabledBorder: FormBorderShape,
        // use to make shape when select the form field
        focusedBorder: focusBorderShape,
      ),
      cursorColor: CursorColor ?? CustomColors.vividGreen49,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      // make validator to check empty
      validator: (String? value) {
        if (value!.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    ),
  );
}
