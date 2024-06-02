import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/home/home_widgets/green_card.dart';
import 'package:zero_waste_app/modules/home/home_widgets/points_info_dialog.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
              child: Row(
                children: [
                  const Image(
                    fit: BoxFit.cover,
                    image: AssetImage(Assets.appImage),
                    width: 77.27,
                    height: 40,
                  ),
                  const Spacer(),
                  const Image(
                    fit: BoxFit.cover,
                    image: AssetImage(Assets.locationImage),
                    width: 32,
                    height: 29,
                  ),
                  Text(
                    '\n Bins Locations',
                    style: CustomTextStyle.extraBold16
                        .copyWith(fontSize: 14, height: 0.75)
                        .responsive(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                                .copyWith(color: CustomColors.grey61)
                                .responsive(context)),
                        TextSpan(
                            text: 'AEKS!',
                            style: CustomTextStyle.bold20.responsive(context)),
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
                    onTap: () => pointsInfoDialog(context: context),
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 2, color: CustomColors.vividGreen49),
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
                                      style: CustomTextStyle.regular12
                                          .responsive(context)),
                                  TextSpan(
                                      text: "1719",
                                      style: CustomTextStyle.bold22
                                          .copyWith(color: Colors.black)
                                          .responsive(context)),
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            left: 0,
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
                controller: PageController(viewportFraction: 0.94),
                scrollDirection: Axis.horizontal,
                children: [
                  homeGreenCard(
                    context: context,
                    image: Assets.homeCardImage1,
                    text: "EARN 100\nPOINTS FREE",
                    onPressed: () {},
                    buttonText: 'Enroll Now',
                  ),
                  homeGreenCard(
                    context: context,
                    image: Assets.homeCardImage2,
                    text: "Environmental\nStatus",
                    onPressed: () {},
                    buttonText: 'Click Here',
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Text('Recyclables',
                  style: CustomTextStyle.medium14.responsive(context)),
            )
          ],
        ),
      ),
    );
  }
}
