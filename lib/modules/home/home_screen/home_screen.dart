import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zero_waste_app/modules/home/exchange/exchange_screen.dart';
import 'package:zero_waste_app/modules/home/home_screen/cubit/home_cubit.dart';
import 'package:zero_waste_app/modules/home/home_screen/cubit/home_state.dart';
import 'package:zero_waste_app/modules/home/home_screen/home_widgets/bottom_nav_bar_items.dart';
import 'package:zero_waste_app/modules/home/home_screen/home_widgets/congratulation_dialog.dart';
import 'package:zero_waste_app/modules/home/home_screen/home_widgets/green_card.dart';
import 'package:zero_waste_app/modules/home/home_screen/home_widgets/home_grid_items.dart';
import 'package:zero_waste_app/modules/home/home_screen/home_widgets/points_info_dialog.dart';
import 'package:zero_waste_app/modules/home/bin_location/map_screen.dart';
import 'package:zero_waste_app/modules/home/profile/profile_screen.dart';
import 'package:zero_waste_app/modules/home/qr_code/qr_scan_screen.dart';
import 'package:zero_waste_app/modules/home/statistics/statistics_screen.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..gridCategoryLists(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var homeCubit = HomeCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16, top: 10),
                            child: Row(
                              children: [
                                const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(Assets.imagesApp),
                                  width: 77.27,
                                  height: 40,
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () => navigate(
                                      context: context,
                                      pageScreen: const MapScreen()),
                                  child: Wrap(
                                    children: [
                                      const Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            Assets.imagesHomeLocation),
                                        width: 32,
                                        height: 29,
                                      ),
                                      Text(
                                        '\n Bins Locations',
                                        style: CustomTextStyle.extraBold16
                                            .copyWith(
                                                fontSize: 14, height: 0.75)
                                            .responsive(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Hello",
                                          style: CustomTextStyle.bold20
                                              .copyWith(color: Colors.black)
                                              .responsive(context)),
                                      TextSpan(
                                          text: ", ",
                                          style: CustomTextStyle.bold20
                                              .copyWith(
                                                  color: CustomColors.grey61)
                                              .responsive(context)),
                                      TextSpan(
                                          text: 'NAME!',
                                          style: CustomTextStyle.bold20
                                              .responsive(context)),
                                      TextSpan(
                                          text: "\nRecycle , save and earn.",
                                          style: CustomTextStyle.regular12
                                              .copyWith(height: 3)
                                              .responsive(context))
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () =>
                                      pointsInfoDialog(context: context),
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 2,
                                            color: CustomColors.vividGreen49),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 25.0),
                                          child: Text.rich(
                                            textAlign: TextAlign.center,
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "Total Points\n",
                                                    style: CustomTextStyle
                                                        .regular12
                                                        .responsive(context)),
                                                TextSpan(
                                                    text: "1719",
                                                    style: CustomTextStyle
                                                        .bold22
                                                        .copyWith(
                                                            color: Colors.black)
                                                        .responsive(context)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          bottom: -2,
                                          left: -2,
                                          child: Icon(
                                            Icons.info_outline,
                                            color: CustomColors.vividGreen49,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: PageView(
                              controller:
                                  PageController(viewportFraction: 0.94),
                              scrollDirection: Axis.horizontal,
                              children: [
                                homeGreenCard(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  context: context,
                                  image: Assets.imagesHomeCard1,
                                  text: "EARN 100\nPOINTS FREE",
                                  onPressed: () {
                                    congratulationDialog(context: context);
                                  },
                                  buttonText: 'Earn Now',
                                ),
                                homeGreenCard(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  context: context,
                                  image: Assets.imagesHomeCard2,
                                  text: "Environmental\nStatus",
                                  onPressed: () async {
                                    await launchUrl(
                                        Uri.parse(
                                            "https://www.envisionenvironmental.com/links"),
                                        mode: LaunchMode.inAppWebView);
                                  },
                                  buttonText: 'Click Here',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10),
                            child: Text('Recyclables',
                                style: CustomTextStyle.medium14
                                    .copyWith(color: CustomColors.grey61)
                                    .responsive(context)),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
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
                                  child: TextButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor:
                                          Colors.black.withOpacity(0.4),
                                      elevation: homeCubit.currentIndex == index
                                          ? 5
                                          : 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      backgroundColor: homeCubit.currentIndex ==
                                              index
                                          ? Colors
                                              .white // Selected button color
                                          : CustomColors
                                              .greyF3, // Default background color
                                    ),
                                    onPressed: () =>
                                        homeCubit.onChangeIndex(index),
                                    child: Text(
                                        homeCubit.buttonsNameList[index],
                                        style: CustomTextStyle.semiBold14
                                            .copyWith(
                                                color: homeCubit.currentIndex ==
                                                        index
                                                    ? CustomColors.vividGreen49
                                                    : CustomColors.grey85)
                                            .responsive(context)),
                                  ),
                                );
                              }),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height *
                                  0.58, // Adjust height as needed
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: itemGridShape(
                                context: context,
                                text: homeCubit
                                    .textListSelected[homeCubit.currentIndex],
                                imageName: homeCubit
                                    .imagesListSelected[homeCubit.currentIndex],
                                scrollController: homeCubit.scrollController,
                              ),
                            ),
                          ),
                          homeCubit.currentIndex == 3
                              ? Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 25),
                                    decoration: ShapeDecoration(
                                      color: CustomColors.vividGreen49,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      "Glass is under Construction",
                                      style: CustomTextStyle.extraBold22
                                          .responsive(context),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: Row(
                      children: [
                        bottomNavBarItem(
                            assetName: Assets.iconsSmileHome,
                            labelName: "Home",
                            context: context,
                            onTap: () {}),
                        bottomNavBarItem(
                            assetName: Assets.iconsStatistics,
                            labelName: "Statistics",
                            context: context,
                            onTap: () {
                              navigate(
                                  context: context,
                                  pageScreen: const StatisticsScreen());
                            }),
                        NavBarCircleButton(
                            context: context,
                            onTap: () {
                              navigate(
                                  context: context,
                                  pageScreen: const QrScanScreen());
                            }),
                        bottomNavBarItem(
                            assetName: Assets.iconsExchangeArrow,
                            labelName: "Exchange",
                            context: context,
                            onTap: () {
                              navigate(
                                  context: context,
                                  pageScreen: const ExchangeScreen());
                            }),
                        bottomNavBarItem(
                            assetName: Assets.iconsProfile,
                            labelName: "Profile",
                            context: context,
                            onTap: () {
                              navigate(
                                  context: context,
                                  pageScreen: const ProfileScreen());
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
