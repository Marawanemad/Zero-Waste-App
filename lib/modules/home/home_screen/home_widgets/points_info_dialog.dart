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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            infoDetails(
                text: "Plastic",
                context: context,
                weight: "300",
                score: "50",
                spaceWidth: 12),
            infoDetails(
                text: "Metal",
                context: context,
                weight: "100",
                score: "50",
                spaceWidth: 20),
            infoDetails(
                text: "Paper",
                context: context,
                weight: "500",
                score: "50",
                spaceWidth: 18),
            infoDetails(
                text: "Glass",
                context: context,
                weight: "1000",
                score: "50",
                spaceWidth: 19),
          ],
        )),
  );
}

Widget infoDetails({
  required text,
  required context,
  required weight,
  required score,
  required double spaceWidth,
}) {
  return Row(
    children: [
      Text(
        text,
        style: CustomTextStyle.bold16.responsive(context),
      ),
      SizedBox(width: spaceWidth),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
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
    ],
  );
}
