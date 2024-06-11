import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class DefaultGreenButton extends StatelessWidget {
  const DefaultGreenButton({
    super.key,
    this.boardController,
    required this.text,
    this.textSize,
    this.onPressed,
    this.iconPath,
    this.radius = 15,
    this.horizontalPadding = 15,
    this.verticalPadding = 15,
  });
  final PageController? boardController;
  final String text;
  final double? textSize;
  final String? iconPath;
  final void Function()? onPressed;
  final int radius;
  final double? horizontalPadding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: CustomColors.vividGreen5A,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 45,
            vertical: verticalPadding ?? 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: CustomTextStyle.bold20
                  .copyWith(fontSize: textSize ?? 20, color: Colors.white)
                  .responsive(context),
            ),
            iconPath != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(
                      iconPath!,
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
