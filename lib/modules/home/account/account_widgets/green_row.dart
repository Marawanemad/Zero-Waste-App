import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget greenDebitCardRow(
    {required context,
    required icon,
    required onIconPressed,
    required onRowTap,
    required visaNumber,
    required name}) {
  return Container(
    padding: const EdgeInsets.only(left: 8),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [CustomColors.vividGreen5A, CustomColors.liteGreenBA],
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onRowTap,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "VISA",
                    style: CustomTextStyle.medium10
                        .copyWith(color: Colors.black)
                        .responsive(context),
                  ),
                  TextSpan(
                    text: ": XXXX XXXX XXXX $visaNumber",
                    style: CustomTextStyle.medium10
                        .copyWith(color: CustomColors.darkGreen28)
                        .responsive(context),
                  ),
                  TextSpan(
                    text: "       Holder: ",
                    style: CustomTextStyle.medium10
                        .copyWith(color: Colors.black)
                        .responsive(context),
                  ),
                  TextSpan(
                    text: "$name",
                    style: CustomTextStyle.medium10
                        .copyWith(color: CustomColors.darkGreen28)
                        .responsive(context),
                  ),
                ],
              ),
            ),
          ),
        ),
        IconButton(onPressed: onIconPressed, icon: icon)
      ],
    ),
  );
}
