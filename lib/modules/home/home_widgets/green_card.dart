import 'package:flutter/material.dart';

import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget homeGreenCard({
  required context,
  required onPressed,
  required String image,
  required String text,
  required String buttonText,
}) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    decoration: const BoxDecoration(
      color: CustomColors.vividGreen49,
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: CustomTextStyle.extraBold24,
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: onPressed,
                  color: CustomColors.liteGreenF1,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10.0),
                    child: Text(
                      buttonText,
                      style: CustomTextStyle.bold20.copyWith(
                          fontSize: 12, color: CustomColors.darkGreen28),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ],
    ),
  );
}
