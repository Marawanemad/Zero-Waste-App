import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
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
      body: scrollScreenResponsive(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0, bottom: 30),
              child: Text(
                "Your QR Code",
                style: CustomTextStyle.bold24.responsive(context),
              ),
            ),
            SizedBox(
              width: 250,
              height: 250,
              child: QrImageView(
                data: '1234567890',
                version: QrVersions.auto,
                size: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
