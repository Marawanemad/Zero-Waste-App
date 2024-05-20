import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zerowasteapp/models/boarding_model.dart';
import 'package:zerowasteapp/shared/extensions/context_width_extension.dart';
import 'package:zerowasteapp/shared/themes/font_styles.dart';

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
      children: model.isLast
          ? [
              Image.asset(model.image),
              const SizedBox(height: 40.0),
              Text(model.title,
                  style: CustomTextStyle.bold24.responsive(context)),
            ]
          : [
              Image.asset(model.image),
              const SizedBox(height: 80.0),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(model.title,
                    style: CustomTextStyle.bold32.responsive(context)),
              ),
              const SizedBox(height: 10),
              Text(model.body!,
                  style: CustomTextStyle.thin24.responsive(context)),
            ],
    );
  }
}
