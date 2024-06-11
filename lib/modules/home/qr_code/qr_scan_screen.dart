import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

class QrScanScreen extends StatelessWidget {
  const QrScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: Row(
          children: [
            Text(
              "QR Scan",
              style: CustomTextStyle.bold24.responsive(context),
            ),
            const Image(
                image: AssetImage(Assets.imagesHomeQr), width: 62, height: 87)
          ],
        ),
        context: context,
      ),
    );
  }
}
