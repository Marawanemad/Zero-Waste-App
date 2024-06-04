import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget bottomNavBarItem(
    {required labelName,
    required assetName,
    required context,
    required onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: SvgPicture.asset(
            assetName,
            height: 30.0.getResponsiveFontSize(context),
          ),
        ),
        Text(
          labelName,
          style: CustomTextStyle.regular12
              .copyWith(
                  color: labelName == "Home"
                      ? CustomColors.vividGreen25
                      : CustomColors.grey61)
              .responsive(context),
        )
      ]),
    ),
  );
}

Widget NavBarCircleButton({required context, required onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Material(
        shape: const CircleBorder(),
        child: Container(
          width: 70.0,
          height: 70.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              stops: [0.005, 1],
              colors: [
                CustomColors.greyAB,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
          child: ClipOval(
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/qr_code.svg',
                height: 40.0.getResponsiveFontSize(context),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
