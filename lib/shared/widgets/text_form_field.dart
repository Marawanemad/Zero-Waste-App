import 'package:flutter/material.dart';
import 'package:zerowasteapp/shared/themes/colors.dart';

// to make text form field to reuse it
formField({
  required TextEditingController controller,
  required TextInputType keyboardtype,
  String? labelText,
  TextStyle? labelStyle,
  String? hintText,
  TextStyle? hintStyle,
  Icon? prefixicon,
  IconData? suffixicon,
  suffixpressed,
  bool? obscureText,
  String? validiationMesseage,
  TextInputAction? text_input_action,
  onsubmit(value)?,
  InputBorder? FormBorderShape,
  InputBorder? FoucsBorderShape,
  double circularBorder = 8,
  Color? prefixIconColor,
  Color? suffixiconColor,
  Color? BorderColor,
  Color? CursorColor,
  padding,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 7.0),
    child: TextFormField(
      maxLines: keyboardtype == TextInputType.multiline ? null : 1,
      obscureText: obscureText ?? false,
      controller: controller,
      // to make action when click on keyboard submit
      textInputAction: text_input_action,
      decoration: InputDecoration(
          prefix: SizedBox(width: 10),
          // text appear in box and when you pressed on it move to up and donot disappear
          labelText: labelText,
          labelStyle: labelStyle ?? TextStyle(color: Colors.black),
          // word appear when presed on box and disappeared when user write
          hintText: hintText,
          hintStyle: hintStyle,
          // to put icon in the start of box
          prefixIcon: prefixicon,
          prefixIconColor: prefixIconColor ?? Colors.black,
          suffixIcon: Padding(
            padding: padding ?? EdgeInsets.all(0),
            child: IconButton(
                onPressed: suffixpressed,
                icon: Icon(
                  suffixicon,
                  color: suffixiconColor ?? Colors.black,
                )),
          ),
          // use to make shape when not select the form field
          enabledBorder: FormBorderShape,
          // use to make shape when select the form field
          focusedBorder: FoucsBorderShape),
      cursorColor: CursorColor ?? CustomColors.vividGreen49,
      keyboardType: keyboardtype,
      onFieldSubmitted: onsubmit,
      // make validator to check empty
      validator: (String? value) {
        if (value!.isEmpty) {
          return validiationMesseage;
        }
        return null;
      },
    ),
  );
}
