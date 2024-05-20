import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zero_waste_app/shared/extensions/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class DefaultGreenButton extends StatelessWidget {
  const DefaultGreenButton({
    super.key,
    required this.boardController,
    required this.text,
    this.onPressed,
    required this.iconPath,
    this.radius = 15,
  });
  final PageController boardController;
  final String text;
  final String iconPath;
  final void Function()? onPressed;
  final int radius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: CustomColors.vividGreen49,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: CustomTextStyle.bold20
                  .copyWith(color: Colors.white)
                  .responsive(context),
            ),
            iconPath.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(
                      iconPath,
                      height: 15.0.getResponsiveFontSize(context),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
