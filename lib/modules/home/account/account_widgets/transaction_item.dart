import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget transactionItem(
    {required context,
    required imageName,
    required walletName,
    required transactionDate,
    required pointNumber,
    required money}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
    child: Row(
      children: [
        Image(
          width: 45,
          height: 45,
          image: AssetImage(imageName),
        ),
        const SizedBox(width: 25),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "$walletName\n",
                style: CustomTextStyle.semiBold16.responsive(context),
              ),
              TextSpan(
                text: transactionDate,
                style: CustomTextStyle.regular12
                    .copyWith(fontSize: 10, color: Colors.black)
                    .responsive(context),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "$pointNumber Point\n",
                style: CustomTextStyle.extraLite13.responsive(context),
              ),
              TextSpan(
                text: "EGP $money",
                style: CustomTextStyle.semiBold16
                    .copyWith(fontSize: 15, color: CustomColors.vividGreen49)
                    .responsive(context),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
