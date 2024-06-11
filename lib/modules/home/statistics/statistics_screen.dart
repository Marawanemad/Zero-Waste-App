import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: Row(
          children: [
            Text(
              "Statistics",
              style: CustomTextStyle.bold24.responsive(context),
            ),
            const Image(
                image: AssetImage(Assets.imagesHomeStatistics),
                width: 76,
                height: 107)
          ],
        ),
        context: context,
      ),
    );
  }
}
