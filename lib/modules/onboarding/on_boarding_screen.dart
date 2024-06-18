import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zero_waste_app/models/boarding_model.dart';
import 'package:zero_waste_app/modules/authentication/auth_screen.dart';
import 'package:zero_waste_app/modules/onboarding/on_boarding_item_widget.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/data/local/shared_pref_keys_enum.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<BoardingModel> boarding = [
    BoardingModel(
      image: Assets.imagesOnboardingOnboarding1,
      title: "Recycle",
      body: "Your Trash",
    ),
    BoardingModel(
      image: Assets.imagesOnboardingOnboarding2,
      title: "Earn",
      body: "Points, Money",
    ),
    BoardingModel(
      image: Assets.imagesApp,
      title: "Green Eco Taste",
      body: "",
      isLast: true,
    ),
  ];

  void _endOnBoarding() {
    navigateAndFinish(context: context, pageScreen: const AuthScreen());
    CacheHelper.setData(SharedPrefKeys.onBoarding.key, false);
  }

  final PageController boardController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.liteGreenF1,
      appBar: AppBar(
        backgroundColor: CustomColors.liteGreenF1,
        actions: [
          !isLast
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    onPressed: () => _endOnBoarding(),
                    child: const Row(
                      children: [
                        Text(
                          "Skip",
                          style: CustomTextStyle.semiBold16,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) =>
                    setState(() => isLast = index == (boarding.length - 1)),
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemCount: boarding.length,
                itemBuilder: (context, index) => FittedBox(
                  fit: BoxFit.scaleDown,
                  child: OnBoardingItemWidget(
                    model: boarding[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DefaultGreenButton(
              boardController: boardController,
              text: isLast ? 'Start' : "Next",
              iconPath: !isLast ? Assets.iconsArrow : null,
              radius: isLast ? 140 : 15,
              onPressed: () {
                if (isLast) {
                  _endOnBoarding();
                } else {
                  boardController.nextPage(
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.easeInToLinear,
                  );
                }
              },
            ),
            const SizedBox(height: 42),
            SmoothPageIndicator(
              controller: boardController,
              count: boarding.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: CustomColors.vividGreen49,
                dotColor: Color(0xFFD9D9D9),
                dotHeight: 6,
                dotWidth: 13,
                expansionFactor: 5,
                radius: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
