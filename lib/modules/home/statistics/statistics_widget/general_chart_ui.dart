import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/home/statistics/statistics_widget/statistics_widget.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget generalChartUI(
    {required context,
    required backgroundColor,
    required firstText,
    required expandedWidget,
    required indexOfChart,
    Widget? secondStackWidget}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.65,
    decoration: ShapeDecoration(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    child: Stack(
      alignment: indexOfChart == 2 ? Alignment.center : Alignment.topRight,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(firstText,
                  style: CustomTextStyle.extraBold18
                      .copyWith(
                          color: indexOfChart == 0
                              ? CustomColors.darkGrey41
                              : null,
                          fontSize: indexOfChart == 0 ? 16 : null)
                      .responsive(context)),
              indexOfChart == 3
                  ? const Column(
                      children: [
                        SizedBox(height: 27),
                        Row(
                          children: <Widget>[
                            Indicator(
                              color: CustomColors.blueDA,
                              text: 'This year',
                              size: 16,
                            ),
                            SizedBox(width: 15),
                            Indicator(
                              color: CustomColors.orange4A,
                              text: 'Last year',
                              size: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 38),
                      ],
                    )
                  : const SizedBox(height: 38),
              Expanded(
                child: expandedWidget,
              ),
            ],
          ),
        ),
        secondStackWidget ?? const SizedBox()
      ],
    ),
  );
}
