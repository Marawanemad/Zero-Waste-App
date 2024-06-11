import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: Row(
          children: [
            Text(
              "Exchange",
              style: CustomTextStyle.bold24.responsive(context),
            ),
            const Image(
                image: AssetImage(Assets.imagesHomeExchange),
                width: 45,
                height: 63)
          ],
        ),
        context: context,
      ),
    );
  }
}
