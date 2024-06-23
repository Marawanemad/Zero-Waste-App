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
    padding: const EdgeInsets.symmetric(horizontal: 20),
    crossAxisSpacing: 20,
    crossAxisCount: 2,
    children: List.generate(
      text.length,
      (index) => Transform.scale(
        scaleX: 0.9,
        scaleY: 0.75,
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: CustomColors.vividGreen49),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image(
                  image: AssetImage(imageName[index]),
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                text[index],
                style: CustomTextStyle.bold12.responsive(context),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    ),
  );
}
