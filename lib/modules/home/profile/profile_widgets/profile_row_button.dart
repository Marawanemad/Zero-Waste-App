import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';

import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget rowButton(
    {required context,
    required assetIconName,
    height,
    required text,
    required pageScreen}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.5),
    child: InkWell(
      onTap: () {
        navigate(context: context, pageScreen: pageScreen);
      },
      child: Row(
        children: [
          SvgPicture.asset(
            width: 20,
            height: height ?? 20,
            assetIconName,
            colorFilter: const ColorFilter.mode(
                CustomColors.vividGreen49, BlendMode.srcIn),
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: CustomTextStyle.semiBold12.responsive(context),
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 35,
            color: CustomColors.grey89,
          )
        ],
      ),
    ),
  );
}
