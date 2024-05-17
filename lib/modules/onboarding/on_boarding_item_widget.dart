import 'package:flutter/material.dart';
import 'package:zerowasteapp/models/boarding_model.dart';
import 'package:zerowasteapp/shared/extensions/context_width_extension.dart';
import 'package:zerowasteapp/shared/themes/font_styles.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.model,
    required this.isLast,
  });

  final BoardingModel model;

  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: isLast
          ? [
              Image.asset(model.image),
              const SizedBox(height: 40.0),
              Text(model.title,
                  style: CustomTextStyle.bold24.responsive(context)),
            ]
          : [
              Image.asset(model.image),
              const SizedBox(height: 80.0),
              Text(model.title,
                  style: CustomTextStyle.bold32.responsive(context)),
              const SizedBox(height: 10),
              Text(model.body!,
                  style: CustomTextStyle.thin24.responsive(context)),
            ],
    );
  }
}