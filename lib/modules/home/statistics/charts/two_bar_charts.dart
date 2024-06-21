import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/home/statistics/statistics_widget/statistics_widget.dart';

import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class TwoBarCharts extends StatefulWidget {
  const TwoBarCharts({super.key});

  @override
  State<StatefulWidget> createState() => TwoBarChartsState();
}

class TwoBarChartsState extends State<TwoBarCharts> {
  final Duration animDuration = const Duration(milliseconds: 400);
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.only(bottom: 40),
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Gained Points",
                  style: CustomTextStyle.extraBold18.responsive(context)),
              const SizedBox(height: 27),
              Row(
                children: <Widget>[
                  Indicator(
                    color: CustomColors.blueDA,
                    text: 'This year',
                    size: touchedIndex == 2 ? 18 : 16,
                  ),
                  const SizedBox(width: 15),
                  Indicator(
                    color: CustomColors.orange4A,
                    text: 'Last year',
                    size: touchedIndex == 1 ? 18 : 16,
                  ),
                ],
              ),
              const SizedBox(height: 38),
              Expanded(
                child: BarChart(
                  mainBarData(),
                  swapAnimationDuration: animDuration,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
    double y2, {
    bool isTouched = false,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          toY: y,
          color: CustomColors.blueDA,
          width: 7,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.white,
          ),
        ),
        BarChartRodData(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          toY: y2,
          color: CustomColors.orange4A,
          width: 7,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.white,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(12, (i) {
      switch (i) {
        case 0:
          return makeGroupData(0, 6, 6.5);
        case 1:
          return makeGroupData(1, 8, 5);
        case 2:
          return makeGroupData(2, 12, 7.5);
        case 3:
          return makeGroupData(3, 11, 9);
        case 4:
          return makeGroupData(4, 6, 11.5);
        case 5:
          return makeGroupData(5, 4, 6.5);
        case 6:
          return makeGroupData(6, 2, 6.5);
        case 7:
          return makeGroupData(7, 8, 6.5);
        case 8:
          return makeGroupData(8, 15, 6.5);
        case 9:
          return makeGroupData(9, 9, 6.5);
        case 10:
          return makeGroupData(10, 18, 6.5);
        case 11:
          return makeGroupData(11, 7, 5);
        default:
          return throw Error();
      }
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String? weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Jan';
                break;
              case 1:
                weekDay = 'Feb';
                break;
              case 2:
                weekDay = 'Mar';
                break;
              case 3:
                weekDay = 'Apr';
                break;
              case 4:
                weekDay = 'May';
                break;
              case 5:
                weekDay = 'Jun';
                break;
              case 6:
                weekDay = 'Jul';
                break;
              case 7:
                weekDay = 'Aug';
                break;
              case 8:
                weekDay = 'Sep';
                break;
              case 9:
                weekDay = 'Oct';
                break;
              case 10:
                weekDay = 'Nov';
                break;
              case 11:
                weekDay = 'Dec';
                break;
              default:
                throw Error();
            }

            return BarTooltipItem(
              '$weekDay\n',
              CustomTextStyle.semiBold12.responsive(context),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: CustomTextStyle.semiBold12.responsive(context),
                ),
              ],
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: CustomColors.grey9C.withOpacity(0.2),
          ),
        ),
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(
        drawVerticalLine: false,
        horizontalInterval: 10,
        getDrawingHorizontalLine: (value) => FlLine(
          strokeWidth: 1,
          color: CustomColors.grey9C.withOpacity(0.2),
        ),
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    String? weekDay;
    switch (value.toInt()) {
      case 0:
        weekDay = 'Jan';
        break;
      case 1:
        weekDay = 'Feb';
        break;
      case 2:
        weekDay = 'Mar';
        break;
      case 3:
        weekDay = 'Apr';
        break;
      case 4:
        weekDay = 'May';
        break;
      case 5:
        weekDay = 'Jun';
        break;
      case 6:
        weekDay = 'Jul';
        break;
      case 7:
        weekDay = 'Aug';
        break;
      case 8:
        weekDay = 'Sep';
        break;
      case 9:
        weekDay = 'Oct';
        break;
      case 10:
        weekDay = 'Nov';
        break;
      case 11:
        weekDay = 'Dec';
        break;
      default:
        throw Error();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(
        weekDay,
        style: CustomTextStyle.semiBold12
            .copyWith(color: CustomColors.grey9C)
            .responsive(context),
      ),
    );
  }
}
