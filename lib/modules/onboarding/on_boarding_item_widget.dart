import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zero_waste_app/models/boarding_model.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.model,
  });

  final BoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: model.isLast
          ? [
              // Image.asset(model.image),
              Image(
                image: AssetImage(model.image),
                fit: BoxFit.cover,
              ),
              Text(model.title,
                  style: CustomTextStyle.bold24.responsive(context)),
            ]
          : [
              // Image.asset(model.image),
              Image(
                image: AssetImage(model.image),
                fit: BoxFit.cover,
              ),

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
