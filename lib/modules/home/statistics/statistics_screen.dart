import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_waste_app/modules/home/statistics/charts/bar_chart.dart';
import 'package:zero_waste_app/modules/home/statistics/charts/line_chart.dart';
import 'package:zero_waste_app/modules/home/statistics/charts/pie_chart.dart';
import 'package:zero_waste_app/modules/home/statistics/charts/two_bar_charts.dart';
import 'package:zero_waste_app/modules/home/statistics/cubit/statistics_cubit.dart';
import 'package:zero_waste_app/modules/home/statistics/cubit/statistics_state.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> chartScreens = [
      const BarChartUI(),
      const LineChartUI(),
      const PieChartUI(),
      const TwoBarCharts(),
    ];
    return BlocProvider(
      create: (BuildContext context) => StatisticsCubit(),
      child: BlocConsumer<StatisticsCubit, StatisticsState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var statisticsCubit = StatisticsCubit.get(context);
          return Scaffold(
              appBar: defaultAppBar(
                title: Row(
                  children: [
                    Text(
                      "Statistics",
                      style: CustomTextStyle.bold24.responsive(context),
                    ),
                    const Image(
                        image: AssetImage(Assets.imagesHomeStatistics),
                        width: 76,
                        height: 107)
                  ],
                ),
                context: context,
              ),
              body: scrollScreenResponsive(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: CustomColors.greyF3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: List.generate(4, (index) {
                          return Expanded(
                            flex: index == 2 ? 2 : 1,
                            child: TextButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black.withOpacity(0.4),

                                elevation: statisticsCubit.currentIndex == index
                                    ? 5
                                    : 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                backgroundColor:
                                    statisticsCubit.currentIndex == index
                                        ? Colors.white // Selected button color
                                        : CustomColors
                                            .greyF3, // Default background color
                              ),
                              onPressed: () =>
                                  statisticsCubit.onChangeIndex(index),
                              child: Text(
                                  statisticsCubit.buttonsNameList[index],
                                  style: CustomTextStyle.semiBold14
                                      .copyWith(
                                          color: statisticsCubit.currentIndex ==
                                                  index
                                              ? CustomColors.black19
                                              : CustomColors.grey85)
                                      .responsive(context)),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 65),
                    chartScreens[statisticsCubit.currentIndex],
                    const SizedBox(height: 30),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
