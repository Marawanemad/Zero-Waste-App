import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

void congratulationDialog({required context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.only(top: 40),
        title: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: "Congrats You Earned\n",
                style: CustomTextStyle.bold20
                    .copyWith(color: CustomColors.vividGreen5A)
                    .responsive(context),
              ),
              TextSpan(
                text: "100 Points",
                style: CustomTextStyle.bold20
                    .copyWith(color: CustomColors.yellow3A)
                    .responsive(context),
              ),
            ],
          ),
        ),
        content:
            const Image(image: AssetImage(Assets.imagesHomeCongratulation))),
  );
}
