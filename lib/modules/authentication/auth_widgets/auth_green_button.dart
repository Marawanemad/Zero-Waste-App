import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

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
