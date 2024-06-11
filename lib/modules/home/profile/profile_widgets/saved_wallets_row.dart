import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget SavedWalletsRow({
  required context,
  required icon,
  required imageName,
  required onPressed,
  required walletNumber,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, top: 15),
    child: Row(
      children: [
        Image(
          width: 40,
          image: AssetImage(
            imageName,
          ),
        ),
        const SizedBox(width: 30),
        Text(walletNumber, style: CustomTextStyle.medium14.responsive(context)),
        const Spacer(),
        IconButton(onPressed: onPressed, icon: icon),
        const Spacer()
      ],
    ),
  );
}
