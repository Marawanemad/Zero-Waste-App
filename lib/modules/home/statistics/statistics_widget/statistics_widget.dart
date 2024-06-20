import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    this.size = 16,
  });
  final Color color;
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(width: 2, color: color),
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(text,
            style: CustomTextStyle.regular12
                .copyWith(color: CustomColors.grey9C)
                .responsive(context))
      ],
    );
  }
}
