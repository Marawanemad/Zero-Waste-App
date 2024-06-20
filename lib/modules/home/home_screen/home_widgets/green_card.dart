import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';

import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget homeGreenCard({
  required context,
  required onPressed,
  required String image,
  required String text,
  double? height,
  double? width,
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
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: CustomTextStyle.extraBold24.responsive(context),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10.0),
                  onPressed: onPressed,
                  color: CustomColors.liteGreenF1,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    buttonText,
                    style: CustomTextStyle.bold20
                        .copyWith(fontSize: 12, color: CustomColors.darkGreen28)
                        .responsive(context),
                  ),
                ),
              ],
            ),
          ),
        ),
        Image(
          width: width,
          height: height,
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ],
    ),
  );
}
