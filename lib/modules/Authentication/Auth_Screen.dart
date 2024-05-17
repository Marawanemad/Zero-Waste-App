import 'package:flutter/material.dart';
import 'package:zerowasteapp/shared/assets.dart';
import 'package:zerowasteapp/shared/themes/colors.dart';
import 'package:zerowasteapp/shared/themes/font_styles.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(Build) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 5,
      ),
      body: Column(
        children: [
          // make animation shape when start screen
          AnimatedCrossFade(
            crossFadeState: CrossFadeState.showFirst,
            duration: Duration(seconds: 1),
            // image with circular radius
            firstChild: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // to divided the gradient color
                      stops: [0.2, 1],
                      colors: [Colors.white, CustomColors.vividGreen61]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Image(
                  image: AssetImage(Assets.imagesAuthentication1),
                  width: double.infinity),
            ),
            secondChild: SizedBox(),
          ),
          SizedBox(height: 25),
          // Text with many colors
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(children: [
              TextSpan(
                text: "Discover Yourself\n With",
                style: CustomTextStyle.bold34.copyWith(height: 1.1),
              ),
              TextSpan(
                text: " Zero Waste",
                style: CustomTextStyle.bold32
                    .copyWith(fontSize: 30, color: CustomColors.vividGreen5A),
              ),
            ]),
          ),
          SizedBox(height: 25),
          Text(
            "You are on the right path\n to change tour behavior...and earn money",
            textAlign: TextAlign.center,
            style: CustomTextStyle.regular12.copyWith(color: Colors.black),
          ),
          Spacer(),
          // make two buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Card(
              color: Colors.white.withOpacity(0),
              elevation: 5,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                authButton(
                    button_color: CustomColors.vividGreen5A,
                    button_text: Text("Sign in",
                        style: CustomTextStyle.bold16
                            .copyWith(color: Colors.white)),
                    lift_radius: true),
                authButton(
                    button_color: CustomColors.greyF3,
                    button_text: Text("Register",
                        style: CustomTextStyle.bold16
                            .copyWith(color: CustomColors.darkgrey52)),
                    lift_radius: false)
              ]),
            ),
          ),
          Spacer(),
          // Text with many colors
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(children: [
              TextSpan(
                text: "By logging in or registering, you agree to our\n",
                style: CustomTextStyle.bold10
                    .copyWith(color: CustomColors.vividGreen5A),
              ),
              TextSpan(text: "Terms of Service", style: CustomTextStyle.bold10),
              TextSpan(
                  text: " and ",
                  style: CustomTextStyle.bold10
                      .copyWith(color: CustomColors.vividGreen5A)),
              TextSpan(text: "Privacy Policy", style: CustomTextStyle.bold10),
            ]),
          ),
          SizedBox(height: 25)
        ],
      ),
    );
  }
}

Widget authButton({
  required Text button_text,
  required Color button_color,
  required bool lift_radius,
}) {
  return Expanded(
    child: InkWell(
      onTap: () {},
      child: Container(
        child: Center(child: button_text),
        height: 47.0,
        decoration: BoxDecoration(
          color: button_color,
          borderRadius: BorderRadius.horizontal(
            left: lift_radius ? Radius.circular(20) : Radius.zero,
            right: lift_radius ? Radius.zero : Radius.circular(20),
          ),
        ),
      ),
    ),
  );
}
