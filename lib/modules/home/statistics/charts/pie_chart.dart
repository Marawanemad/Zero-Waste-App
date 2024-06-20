import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/home/statistics/statistics_widget/statistics_widget.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class PieChartUI extends StatefulWidget {
  const PieChartUI({super.key});

  @override
  State<PieChartUI> createState() => _PieChartUIState();
}

class _PieChartUIState extends State<PieChartUI> {
  final Color plasticColor = CustomColors.blueDA;
  final Color metalColor = CustomColors.greyDA;
  final Color paperColor = CustomColors.orange4A;
  final Color glassColor = CustomColors.pinkCA;
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.only(bottom: 40),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('Materials',
                          style:
                              CustomTextStyle.extraBold18.responsive(context)),
                      const SizedBox(height: 38),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: PieChart(
                            pieChartData(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.25,
                  child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        TextSpan(
                            text: "Total\n",
                            style: CustomTextStyle.bold18.responsive(context)),
                        TextSpan(
                            text: "110 Throw",
                            style:
                                CustomTextStyle.extraLite18.responsive(context))
                      ])),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Indicator(
                color: plasticColor,
                text: 'Plastic',
                size: touchedIndex == 2 ? 18 : 16,
              ),
              Indicator(
                color: metalColor,
                text: 'Metal',
                size: touchedIndex == 1 ? 18 : 16,
              ),
              Indicator(
                color: glassColor,
                text: 'Glass',
                size: touchedIndex == 0 ? 18 : 16,
              ),
              Indicator(
                color: paperColor,
                text: 'Paper',
                size: touchedIndex == 3 ? 18 : 16,
              ),
            ],
          ),
        ],
      ),
    );
  }

  PieChartData pieChartData() {
    return PieChartData(
      pieTouchData: PieTouchData(
        touchCallback: (FlTouchEvent event, pieTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
          });
        },
      ),
      startDegreeOffset: 38,
      borderData: FlBorderData(
        show: false,
      ),
      sectionsSpace: 0,
      centerSpaceRadius: 120,
      sections: showingSections(),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        final radius = isTouched ? 60.0 : 50.0;

        switch (i) {
          case 0:
            return PieChartSectionData(
                color: glassColor,
                value: 20,
                title: '20%',
                radius: radius,
                titleStyle: CustomTextStyle.semiBold11);
          case 1:
            return PieChartSectionData(
                color: metalColor,
                value: 23,
                title: '23%',
                radius: radius,
                titleStyle: CustomTextStyle.semiBold11);
          case 2:
            return PieChartSectionData(
                color: plasticColor,
                value: 40,
                title: '40%',
                radius: radius,
                titleStyle: CustomTextStyle.semiBold11);
          case 3:
            return PieChartSectionData(
                color: paperColor,
                value: 47,
                title: '47%',
                radius: radius,
                titleStyle: CustomTextStyle.semiBold11);
          default:
            throw Error();
        }
      },
    );
  }
}
