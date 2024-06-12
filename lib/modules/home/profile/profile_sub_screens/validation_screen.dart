import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/home/home_screen/home_screen.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

// ignore: must_be_immutable
class ValidationScreen extends StatefulWidget {
  ValidationScreen({super.key, required this.successState});
  bool successState;

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        loading = false;
      });
    });
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        navigateAndFinish(context: context, pageScreen: const HomeScreen());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: defaultAppBar(
            leading: const SizedBox(),
            context: context,
            title: Text(
              "Validation",
              style: CustomTextStyle.medium18.responsive(context),
            ),
            centerTitle: true),
        body: scrollScreenResponsive(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Column(
              children: [
                const SizedBox(height: 150),
                Text(
                  loading
                      ? "Please Wait"
                      : widget.successState
                          ? "Success"
                          : "Failure",
                  style: CustomTextStyle.bold36.responsive(context).copyWith(
                      color: widget.successState
                          ? CustomColors.vividGreen49
                          : CustomColors.red44),
                ),
                const SizedBox(height: 35),
                Text(
                  loading
                      ? "Please wait for data validation"
                      : widget.successState
                          ? "Data validation success"
                          : "Something Wrong Occurred  ",
                  style: CustomTextStyle.bold14.responsive(context),
                ),
                const SizedBox(height: 30),
                loading
                    ? const CircularProgressIndicator(
                        strokeWidth: 6,
                        color: CustomColors.vividGreen49,
                      )
                    : widget.successState
                        ? const Image(
                            width: 89,
                            height: 89,
                            image: AssetImage(
                                Assets.imagesHomeProfileSuccessState),
                          )
                        : const Image(
                            width: 89,
                            height: 89,
                            image: AssetImage(
                                Assets.imagesHomeProfileFailureState),
                          ),
                const SizedBox(height: 55),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Fun Fact #1\n",
                          style: CustomTextStyle.bold10
                              .copyWith(color: CustomColors.darkGrey7D)
                              .responsive(context)),
                      TextSpan(
                        text:
                            "Did you know, Earth's ozone hole is getting smaller, \nthe impact of the ban on the use of CFC gas\n\n-eea europa",
                        style: CustomTextStyle.regular12
                            .copyWith(
                                fontSize: 10, color: CustomColors.darkGrey7D)
                            .responsive(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
