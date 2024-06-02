import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

void pointsInfoDialog({required context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.info_outline,
              color: CustomColors.vividGreen49,
            ),
            Text(
              "Points Info",
              style: CustomTextStyle.extraBold24
                  .copyWith(color: CustomColors.vividGreen49)
                  .responsive(context),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            infoDetails(
                text: "Plastic", context: context, weight: "300", score: "50"),
            infoDetails(
                text: "Metal", context: context, weight: "300", score: "50"),
            infoDetails(
                text: "Paper", context: context, weight: "300", score: "50"),
            infoDetails(
                text: "Glass", context: context, weight: "300", score: "50"),
          ],
        )),
  );
}

Widget infoDetails({
  required text,
  required context,
  required weight,
  required score,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: CustomTextStyle.bold16.responsive(context),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: "Every ",
                style: CustomTextStyle.regular12
                    .copyWith(fontSize: 16)
                    .responsive(context)),
            TextSpan(
                text: "${weight}g",
                style: CustomTextStyle.semiBold16
                    .copyWith(color: Colors.black)
                    .responsive(context)),
            TextSpan(
                text: " = $score",
                style: CustomTextStyle.semiBold16
                    .copyWith(color: CustomColors.vividGreen49)
                    .responsive(context)),
            TextSpan(
                text: " point",
                style: CustomTextStyle.regular12
                    .copyWith(fontSize: 16)
                    .responsive(context))
          ])),
        ),
      ),
    ],
  );
}
