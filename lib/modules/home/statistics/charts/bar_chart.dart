import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class BarChartUI extends StatefulWidget {
  const BarChartUI({super.key});

  @override
  State<StatefulWidget> createState() => BarChartUIState();
}

class BarChartUIState extends State<BarChartUI> {
  final Duration animDuration = const Duration(milliseconds: 250);

  final Color backgroundColor = CustomColors.vividGreen49.withOpacity(0.6);
  final Color dropDownColor = CustomColors.whiteF0;
  final Color barColor = CustomColors.darkGreen28;
  int touchedIndex = -1;
  List<String> dropDownList = ['Daily', 'Monthly', 'Yearly'];
  String itemSelected = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('$itemSelected Visits',
                    style: CustomTextStyle.extraBold16
                        .copyWith(color: CustomColors.grey41)),
                const SizedBox(height: 38),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      mainBarData(),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.topRight,
              child: DropdownButton<String>(
                dropdownColor: dropDownColor,
                underline: const SizedBox(),
                value: itemSelected,
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
                          .copyWith(color: CustomColors.grey41)
                          .responsive(context),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          width: itemSelected == 'Daily'
              ? 15
              : itemSelected == 'Monthly'
                  ? 9
                  : 22,
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
            return makeGroupData(0, 5);
          case 1:
            return makeGroupData(1, 6.5);
          case 2:
            return makeGroupData(2, 5);
          case 3:
            return makeGroupData(3, 7.5);
          case 4:
            return makeGroupData(4, 9);
          case 5:
            return makeGroupData(5, 11.5);
          case 6:
            return makeGroupData(6, 6.5);
          default:
            return throw Error();
        }
      });
    } else if (itemSelected == 'Monthly') {
      return List.generate(12, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 6.5);
          case 1:
            return makeGroupData(1, 5);
          case 2:
            return makeGroupData(2, 7.5);
          case 3:
            return makeGroupData(3, 9);
          case 4:
            return makeGroupData(4, 11.5);
          case 5:
            return makeGroupData(5, 6.5);
          case 6:
            return makeGroupData(6, 6.5);
          case 7:
            return makeGroupData(7, 6.5);
          case 8:
            return makeGroupData(8, 6.5);
          case 9:
            return makeGroupData(9, 6.5);
          case 10:
            return makeGroupData(10, 6.5);
          case 11:
            return makeGroupData(11, 5);
          default:
            return throw Error();
        }
      });
    } else {
      return List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5);
          case 1:
            return makeGroupData(1, 6.5);
          case 2:
            return makeGroupData(2, 5);
          case 3:
            return makeGroupData(3, 7.5);
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
          tooltipBgColor: dropDownColor,
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
              itemSelected == 'Monthly'
                  ? CustomTextStyle.semiBold8.responsive(context)
                  : CustomTextStyle.extraBold16.responsive(context),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: itemSelected == 'Monthly'
                      ? CustomTextStyle.semiBold8.responsive(context)
                      : CustomTextStyle.extraBold16.responsive(context),
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
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
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
        style: itemSelected == 'Monthly'
            ? CustomTextStyle.semiBold8.responsive(context)
            : CustomTextStyle.extraBold16.responsive(context),
      ),
    );
  }
}
