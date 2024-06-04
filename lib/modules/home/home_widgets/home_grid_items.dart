import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget itemGridShape({
  required context,
  required List<String> text,
  required List<String> imageName,
  required scrollController,
}) {
  return GridView.count(
    controller: scrollController,
    padding: const EdgeInsets.all(20),
    mainAxisSpacing: 15,
    crossAxisSpacing: 48,
    crossAxisCount: 2,
    children: List.generate(
      text.length,
      (index) => Container(
        padding: const EdgeInsets.all(5),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: CustomColors.vividGreen49),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Image(
              image: AssetImage(imageName[index]),
            ),
          ),
          Text(
            text[index],
            style: CustomTextStyle.bold10.responsive(context),
          )
        ]),
      ),
    ),
  );
}
