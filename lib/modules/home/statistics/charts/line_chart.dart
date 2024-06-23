import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/home/statistics/statistics_widget/general_chart_ui.dart';
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
  final Color barColor = CustomColors.darkGreen28;

  List<String> dropDownList = ['Daily', 'Monthly', 'Yearly'];
  String itemSelected = 'Daily';
  double value = 510.0;

  late Future<List<FlSpot>> firstSpots;
  late Future<List<FlSpot>> secondSpots;

  @override
  void initState() {
    super.initState();
    firstSpots = getFirstSpots();
    secondSpots = getSecondSpots();
  }

  Future<List<FlSpot>> getFirstSpots() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return firstListOfSpots();
  }

  Future<List<FlSpot>> getSecondSpots() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return secondListOfSpots();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: CustomColors.vividGreen49),
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
      generalChartUI(
        context: context,
        backgroundColor: Colors.white,
        firstText: 'Earnings',
        expandedWidget: FutureBuilder<List<List<FlSpot>>>(
          future: Future.wait([firstSpots, secondSpots]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: firstLineColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No data available'));
            }
            return LineChart(
              lineChartData(snapshot.data![0], snapshot.data![1]),
            );
          },
        ),
        indexOfChart: 1,
        secondStackWidget: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
              setState(
                () {
                  itemSelected = newValue!;
                  firstSpots = getFirstSpots();
                  secondSpots = getSecondSpots();
                },
              );
            },
            items: dropDownList.map<DropdownMenuItem<String>>(
              (String dateName) {
                return DropdownMenuItem<String>(
                  value: dateName,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      dateName,
                      style: CustomTextStyle.semiBold12
                          .copyWith(color: CustomColors.grey9C)
                          .responsive(context),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      )
    ]);
  }

  LineChartData lineChartData(
      List<FlSpot> firstSpots, List<FlSpot> secondSpots) {
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
              showTitles: true,
              getTitlesWidget: getTitlesLeft,
              reservedSize: 40,
              interval: 1),
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
      lineBarsData: lineBarsData(firstSpots, secondSpots),
    );
  }

  List<LineChartBarData> lineBarsData(
      List<FlSpot> firstSpots, List<FlSpot> secondSpots) {
    return [
      LineChartBarData(
          color: firstLineColor,
          dotData: const FlDotData(show: false),
          isCurved: true,
          spots: firstSpots),
      LineChartBarData(
        dotData: const FlDotData(show: false),
        isCurved: true,
        color: secondLineColor,
        spots: secondSpots,
      ),
    ];
  }

  List<FlSpot> firstListOfSpots() {
    switch (itemSelected) {
      case 'Monthly':
        return const [
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
      case 'Yearly':
        return const [
          FlSpot(0, 500),
          FlSpot(1, 250),
          FlSpot(2, 300),
          FlSpot(3, 200),
        ];
      default:
        return const [
          FlSpot(0, 90),
          FlSpot(1, 125),
          FlSpot(2, 75),
          FlSpot(3, 150),
          FlSpot(4, 500),
          FlSpot(5, 140),
          FlSpot(6, 140),
        ];
    }
  }

  List<FlSpot> secondListOfSpots() {
    switch (itemSelected) {
      case 'Monthly':
        return const [
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
        return const [
          FlSpot(0, 300),
          FlSpot(1, 500),
          FlSpot(2, 100),
          FlSpot(3, 150),
        ];
      default:
        return const [
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
    String title = '';

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
      }
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        title,
        style: CustomTextStyle.regular12
            .copyWith(color: CustomColors.grey9C)
            .responsive(context),
      ),
    );
  }

  Widget getTitlesLeft(double value, TitleMeta meta) {
    String title = '';

    switch (value.toInt()) {
      case 50:
        title = '50';
        break;
      case 100:
        title = '100';

        break;
      case 200:
        title = '200';
        break;

      case 300:
        title = '300';
        break;

      case 400:
        title = '400';
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
        title,
        style: CustomTextStyle.regular12
            .copyWith(color: CustomColors.grey9C)
            .responsive(context),
      ),
    );
  }
}
