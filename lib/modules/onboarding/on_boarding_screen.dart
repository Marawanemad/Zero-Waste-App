import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zerowasteapp/models/boarding_model.dart';
import 'package:zerowasteapp/modules/onboarding/on_boarding_item_widget.dart';
import 'package:zerowasteapp/shared/assets.dart';
import 'package:zerowasteapp/shared/themes/colors.dart';
import 'package:zerowasteapp/shared/themes/font_styles.dart';
import 'package:zerowasteapp/shared/widgets/default_green_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
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
      image: Assets.imagesOnboardingOnboarding3,
      title: "Green Eco Taste",
      body: "",
    ),
  ];
  void _endOnBoarding() {
    // navigateToWithReplacement(context, LoginScreen());
    // CacheHelper.setData(key: 'onBoarding', value: true);
  }

  final PageController boardController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.liteGreenF1,
      appBar: AppBar(
        actions: [
          !isLast
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                onPageChanged: (int index) {
                  setState(() {});
                  if (index == boarding.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                  isLast = index == (boarding.length - 1);
                },
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => OnBoardingItemWidget(
                  model: boarding[index],
                  isLast: isLast,
                ),
                itemCount: boarding.length,
              ),
            ),
            DefaultGreenButton(
              boardController: boardController,
              text: isLast ? 'Start' : "Next",
              iconPath: !isLast ? Assets.iconsArrow : "",
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
