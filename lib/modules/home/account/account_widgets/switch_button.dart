import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget switchButton(
    {required context,
    required onChange,
    required switchValue,
    required text}) {
  return Row(
    children: [
      Transform.scale(
        scale: 0.6,
        child: Switch(
          thumbColor: const WidgetStatePropertyAll(Colors.white),
          inactiveTrackColor: CustomColors.grey96,
          activeColor: CustomColors.vividGreen5A,
          trackOutlineColor:
              WidgetStatePropertyAll(Colors.white.withOpacity(0)),
          onChanged: onChange,
          value: switchValue,
        ),
      ),
      Text(
        text,
        style:
            CustomTextStyle.medium18.copyWith(fontSize: 12).responsive(context),
      )
    ],
  );
}
