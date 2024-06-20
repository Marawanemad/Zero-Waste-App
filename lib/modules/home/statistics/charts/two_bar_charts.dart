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
  List<String> dropDownList = ['Daily', 'Monthly', 'Yearly'];
  String itemSelected = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.only(bottom: 40),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Gained Points",
                          style:
                              CustomTextStyle.extraBold18.responsive(context)),
                      const SizedBox(height: 27),
                      Row(
                        children: <Widget>[
                          Indicator(
                            color: CustomColors.blueDA,
                            text: 'This month',
                            size: touchedIndex == 2 ? 18 : 16,
                          ),
                          const SizedBox(width: 15),
                          Indicator(
                            color: CustomColors.orange4A,
                            text: 'Last month',
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    dropdownColor: Colors.white,
                    underline: const SizedBox(),
                    value: itemSelected,
                    icon: const Icon(Icons.keyboard_arrow_down_sharp,
                        color: CustomColors.grey9C),
                    onChanged: (newValue) {
                      // Use WidgetsBinding.instance.addPostFrameCallback to defer the state update
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          itemSelected = newValue!;
                        });
                      });
                    },
                    items: dropDownList
                        .map<DropdownMenuItem<String>>((String dateName) {
                      return DropdownMenuItem<String>(
                        value: dateName,
                        child: Text(
                          dateName,
                          style: CustomTextStyle.semiBold12
                              .copyWith(color: CustomColors.grey9C)
                              .responsive(context),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
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
          width: itemSelected == 'Daily'
              ? 10
              : itemSelected == 'Monthly'
                  ? 7
                  : 11,
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
          width: itemSelected == 'Daily'
              ? 10
              : itemSelected == 'Monthly'
                  ? 7
                  : 11,
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
    if (itemSelected == 'Daily') {
      return List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, 10);
          case 1:
            return makeGroupData(1, 6.5, 5);
          case 2:
            return makeGroupData(2, 5, 3);
          case 3:
            return makeGroupData(3, 7.5, 5);
          case 4:
            return makeGroupData(4, 9, 6);
          case 5:
            return makeGroupData(5, 11.5, 8);
          case 6:
            return makeGroupData(6, 6.5, 3);
          default:
            return throw Error();
        }
      });
    } else if (itemSelected == 'Monthly') {
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
    } else {
      return List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, 3);
          case 1:
            return makeGroupData(1, 6.5, 10);
          case 2:
            return makeGroupData(2, 5, 9);
          case 3:
            return makeGroupData(3, 7.5, 5);
          default:
            return throw Error();
        }
      });
    }
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String? weekDay;
            if (itemSelected == 'Daily') {
              switch (group.x) {
                case 0:
                  weekDay = 'Sunday';
                  break;
                case 1:
                  weekDay = 'Monday';
                  break;
                case 2:
                  weekDay = 'Tuesday';
                  break;
                case 3:
                  weekDay = 'Wednesday';
                  break;
                case 4:
                  weekDay = 'Thursday';
                  break;
                case 5:
                  weekDay = 'Friday';
                  break;
                case 6:
                  weekDay = 'Saturday';
                  break;
                default:
                  throw Error();
              }
            } else if (itemSelected == 'Monthly') {
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
            } else {
              switch (group.x) {
                case 0:
                  weekDay = '2021';
                  break;
                case 1:
                  weekDay = '2022';
                  break;
                case 2:
                  weekDay = '2023';
                  break;
                case 3:
                  weekDay = '2024';
                  break;
                default:
                  throw Error();
              }
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
    if (itemSelected == 'Daily') {
      switch (value.toInt()) {
        case 0:
          weekDay = 'S';
          break;
        case 1:
          weekDay = 'M';
          break;
        case 2:
          weekDay = 'T';
          break;
        case 3:
          weekDay = 'W';
          break;
        case 4:
          weekDay = 'T';
          break;
        case 5:
          weekDay = 'F';
          break;
        case 6:
          weekDay = 'S';
          break;
        default:
          throw Error();
      }
    } else if (itemSelected == 'Monthly') {
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
    } else {
      switch (value.toInt()) {
        case 0:
          weekDay = '2021';
          break;
        case 1:
          weekDay = '2022';
          break;
        case 2:
          weekDay = '2023';
          break;
        case 3:
          weekDay = '2024';
          break;
        default:
          throw Error();
      }
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
