import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/text_form_field.dart';

Widget AuthGreenButton({required onPressed, required text}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
      onPressed: onPressed,
      color: CustomColors.vividGreen5A,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25.0),
        child: Text(
          text,
          style: CustomTextStyle.bold20
              .copyWith(fontSize: 22, color: Colors.white),
        ),
      ),
    ),
  );
}

Widget Authdivider({required text}) {
  return Expanded(
    flex: 4,
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    stops: [0.2, 1],
                    colors: [CustomColors.vividGreen5A, Colors.white])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(text),
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    stops: [0.2, 1],
                    colors: [CustomColors.vividGreen5A, Colors.white])),
          ),
        )
      ],
    ),
  );
}

Widget SocialLoginButton({Color? color, required icon, required Widget text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 50.0),
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: BorderSide(color: color ?? CustomColors.vividGreen5A),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              // Adjust this value to position the icon as desired
              left: 10,
              child: icon),
          Center(
            child: text,
          ),
        ],
      ),
    ),
  );
}

Widget AuthFormField({
  required hintText,
  bool? obscureText,
  required keyboardtype,
  required text_input_action,
  required controller,
  required validiationMesseage,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    color: CustomColors.greyF3,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
    child: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: formField(
          controller: controller,
          keyboardtype: keyboardtype,
          text_input_action: text_input_action,
          obscureText: obscureText,
          FormBorderShape: InputBorder.none,
          FoucsBorderShape: InputBorder.none,
          hintText: hintText,
          hintStyle: CustomTextStyle.regular12
              .copyWith(color: CustomColors.grey61, fontSize: 16),
          validiationMesseage: validiationMesseage),
    ),
  );
}
