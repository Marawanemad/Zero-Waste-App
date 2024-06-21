import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class LineChartUI extends StatefulWidget {
  const LineChartUI({super.key});

  @override
  State<StatefulWidget> createState() => LineChartUIState();
}

class LineChartUIState extends State<LineChartUI> {
  final Color firstLineColor = CustomColors.vividGreen49;
  final Color secondLineColor = CustomColors.liteGreyE8;
  final Color verticalLineColor = CustomColors.orange4A;
  final Color dropDownColor = CustomColors.whiteF0;
  final Color barColor = CustomColors.darkGreen28;
  final Duration animDuration = const Duration(milliseconds: 400);

  List<String> dropDownList = ['Daily', 'Monthly', 'Yearly'];
  String itemSelected = 'Daily';
  double value = 510.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 60,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side:
                  const BorderSide(width: 2, color: CustomColors.vividGreen49),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: "Total balance\n",
                    style: CustomTextStyle.regular12
                        .copyWith(color: CustomColors.grey9C, fontSize: 14)
                        .responsive(context)),
                TextSpan(
                    text: "EGP $value",
                    style: CustomTextStyle.extraBold18.responsive(context)),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Earnings',
                        style: CustomTextStyle.extraBold18.responsive(context)),
                    const SizedBox(height: 38),
                    Expanded(
                      child: LineChart(
                        lineChartData(),
                        duration: animDuration,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: DropdownButton<String>(
                  alignment: Alignment.center,
                  dropdownColor: Colors.white,
                  underline: Container(
                    height: 30,
                    width: 85,
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.grey9C),
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                  ),
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
    );
  }

  LineChartData lineChartData() {
    return LineChartData(
      gridData: const FlGridData(
        drawVerticalLine: false,
        horizontalInterval: 50,
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
              getTitlesWidget: getTitlesBottom,
              reservedSize: 38,
              interval: 1),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
              reservedSize: 40,
              showTitles: true,
              interval: 1,
              getTitlesWidget: getTitlesLeft),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              const FlLine(
                color: CustomColors.orange4A,
                strokeWidth: 4,
              ),
              FlDotData(getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 8,
                  color: Colors.white,
                  strokeWidth: 5,
                  strokeColor: CustomColors.orange4A,
                );
              }),
            );
          }).toList();
        },
      ),
      maxY: 1001,
      betweenBarsData: [
        BetweenBarsData(
            fromIndex: 0,
            toIndex: 1,
            color: CustomColors.liteGreyF7.withOpacity(0.4))
      ],
      minY: 0,
      lineBarsData: lineBarsData(),
    );
  }

  List<FlSpot> firstListOfSpots = [];
  List<FlSpot> secondListOfSpots = [];
  List<LineChartBarData> lineBarsData() {
    dataOfGraph();
    return [
      LineChartBarData(
          color: firstLineColor,
          dotData: const FlDotData(show: false),
          isCurved: true,
          spots: firstListOfSpots),
      LineChartBarData(
        dotData: const FlDotData(show: false),
        isCurved: true,
        color: secondLineColor,
        spots: secondListOfSpots,
      ),
    ];
  }

  void dataOfGraph() {
    switch (itemSelected) {
      case 'Daily':
        firstListOfSpots = const [
          FlSpot(0, 90),
          FlSpot(1, 125),
          FlSpot(2, 75),
          FlSpot(3, 150),
          FlSpot(4, 500),
          FlSpot(5, 140),
          FlSpot(6, 140),
        ];
        secondListOfSpots = const [
          FlSpot(0, 60),
          FlSpot(1, 60),
          FlSpot(2, 125),
          FlSpot(3, 50),
          FlSpot(4, 125),
          FlSpot(5, 75),
          FlSpot(6, 75),
        ];
      case 'Monthly':
        firstListOfSpots = const [
          FlSpot(0, 300),
          FlSpot(1, 400),
          FlSpot(2, 250),
          FlSpot(3, 100),
          FlSpot(4, 500),
          FlSpot(5, 200),
          FlSpot(6, 400),
          FlSpot(7, 300),
          FlSpot(8, 500),
          FlSpot(9, 100),
          FlSpot(10, 400),
          FlSpot(11, 300),
        ];
        secondListOfSpots = const [
          FlSpot(0, 200),
          FlSpot(1, 300),
          FlSpot(2, 150),
          FlSpot(3, 400),
          FlSpot(4, 100),
          FlSpot(5, 500),
          FlSpot(6, 400),
          FlSpot(7, 200),
          FlSpot(8, 500),
          FlSpot(9, 400),
          FlSpot(10, 300),
          FlSpot(11, 200),
        ];
      case 'Yearly':
        firstListOfSpots = const [
          FlSpot(0, 500),
          FlSpot(1, 250),
          FlSpot(2, 300),
          FlSpot(3, 200),
        ];
        secondListOfSpots = const [
          FlSpot(0, 300),
          FlSpot(1, 500),
          FlSpot(2, 100),
          FlSpot(3, 150),
        ];
      default:
        firstListOfSpots = const [
          FlSpot(0, 75),
          FlSpot(1, 125),
          FlSpot(2, 80),
          FlSpot(3, 150),
          FlSpot(4, 500),
          FlSpot(5, 140),
          FlSpot(6, 140),
        ];
        secondListOfSpots = const [
          FlSpot(0, 60),
          FlSpot(1, 60),
          FlSpot(2, 125),
          FlSpot(3, 50),
          FlSpot(4, 125),
          FlSpot(5, 75),
          FlSpot(6, 75),
        ];
    }
  }

  Widget getTitlesBottom(double value, TitleMeta meta) {
    String? title;
    if (itemSelected == 'Daily') {
      switch (value.toInt()) {
        case 0:
          title = 'Sun';
          break;
        case 1:
          title = 'Mon';
          break;
        case 2:
          title = 'Tue';
          break;
        case 3:
          title = 'Wed';
          break;
        case 4:
          title = 'Thu';
          break;
        case 5:
          title = 'Fri';
          break;
        case 6:
          title = 'Sat';
          break;
        default:
          title = '';
          break;
      }
    } else if (itemSelected == 'Monthly') {
      switch (value.toInt()) {
        case 0:
          title = 'Jan';
          break;
        case 1:
          title = 'Feb';
          break;
        case 2:
          title = 'Mar';
          break;
        case 3:
          title = 'Apr';
          break;
        case 4:
          title = 'May';
          break;
        case 5:
          title = 'Jun';
          break;
        case 6:
          title = 'Jul';
          break;
        case 7:
          title = 'Aug';
          break;
        case 8:
          title = 'Sep';
          break;
        case 9:
          title = 'Oct';
          break;
        case 10:
          title = 'Nov';
          break;
        case 11:
          title = 'Dec';
          break;
        default:
          title = '';
          break;
      }
    } else if (itemSelected == 'Yearly') {
      switch (value.toInt()) {
        case 0:
          title = '2021';
          break;
        case 1:
          title = '2022';
          break;
        case 2:
          title = '2023';
          break;
        case 3:
          title = '2024';
          break;
        default:
          title = '';
          break;
      }
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        title!,
        style: CustomTextStyle.regular12
            .copyWith(color: CustomColors.grey9C)
            .responsive(context),
      ),
    );
  }

  Widget getTitlesLeft(double value, TitleMeta meta) {
    String? title;

    switch (value.toInt()) {
      case 50:
        title = '50';
        break;
      case 100:
        title = '100';
        break;
      case 150:
        title = '150';
        break;
      case 200:
        title = '200';
        break;
      case 250:
        title = '250';
        break;
      case 300:
        title = '300';
        break;
      case 350:
        title = '350';
        break;
      case 400:
        title = '400';
        break;
      case 450:
        title = '450';
        break;
      case 500:
        title = '500';
        break;
      case 600:
        title = '600';
        break;
      case 700:
        title = '700';
        break;
      case 800:
        title = '800';
        break;
      case 900:
        title = '900';
        break;
      case 1000:
        title = '1K+';
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 6,
      child: Text(
        title ?? '',
        style: CustomTextStyle.regular12
            .copyWith(color: CustomColors.grey9C)
            .responsive(context),
      ),
    );
  }
}
