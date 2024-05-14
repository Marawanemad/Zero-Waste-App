import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zerowasteapp/shared/assets.dart';
import 'package:zerowasteapp/shared/extensions/context_width_extension.dart';
import 'package:zerowasteapp/shared/themes/colors.dart';
import 'package:zerowasteapp/shared/themes/font_styles.dart';

class BoardingModel {
  final String image;
  final String title;
  final String? body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

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
      title: "on board 2 title",
      body: "on board 2 body",
    ),
    BoardingModel(
      image: Assets.imagesOnboardingOnboarding3,
      title: "on board 3 title",
      body: "on board 3 body",
    ),
  ];
  void endOnBoarding() {
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
          TextButton(
            onPressed: () => endOnBoarding(),
            child: const Text("Skip"),
          )
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
                  if (index == boarding.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                },
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    OnBoardingItemWidget(model: boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            DefaultGreenButton(
              boardController: boardController,
              isLast: isLast,
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
            // FloatingActionButton(
            //   onPressed: () {
            //     if (isLast) {
            //       endOnBoarding();
            //     } else {
            //       boardController.nextPage(
            //         duration: const Duration(milliseconds: 750),
            //         curve: Curves.easeInToLinear,
            //       );
            //     }
            //   },
            //   child: const Icon(
            //     Icons.arrow_forward_ios,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.model,
  });

  final BoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(model.image),
        const SizedBox(height: 80.0),
        Text(model.title, style: CustomTextStyle.bold32.responsive(context)),
        const SizedBox(height: 10),
        Text(model.body!, style: CustomTextStyle.thin24.responsive(context)),
      ],
    );
  }
}

class DefaultGreenButton extends StatelessWidget {
  DefaultGreenButton(
      {super.key, required this.isLast, required this.boardController});
  bool isLast;
  var boardController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (isLast) {
          // endOnBoarding();
        } else {
          boardController.nextPage(
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeInToLinear,
          );
        }
      },
      color: CustomColors.vividGreen49,
      elevation: 0,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 13),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Next",
              style: CustomTextStyle.bold20.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              Assets.iconsArrow,
              height: 15.0.getResponsiveFontSize(context),
            ),
          ],
        ),
      ),
    );
  }
}
