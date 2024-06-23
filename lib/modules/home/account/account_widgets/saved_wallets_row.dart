import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget SavedWalletsRow({
  required context,
  required icon,
  required imageName,
  required onIconPressed,
  required onRowTap,
  required walletNumber,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, top: 15),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: InkWell(
            onTap: onRowTap,
            child: Row(
              children: [
                Image(
                  width: 40,
                  image: AssetImage(
                    imageName,
                  ),
                ),
                const SizedBox(width: 30),
                Text(walletNumber,
                    style: CustomTextStyle.medium14.responsive(context)),
              ],
            ),
          ),
        ),
        IconButton(onPressed: onIconPressed, icon: icon),
        const Spacer()
      ],
    ),
  );
}
