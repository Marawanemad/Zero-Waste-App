import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/authentication/login/login_screen.dart';
import 'package:zero_waste_app/modules/authentication/register/register_screen.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/navigator.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  double _imageOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _fadeInWidgets();
  }

  // to change the opacity when the screen start
  void _fadeInWidgets() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _imageOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 5,
      ),
      // make animation in the page
      body: Column(
        children: [
          // Animated opacity for the image
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 1],
                colors: [Colors.white, CustomColors.vividGreen61],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: const Image(
              image: AssetImage(Assets.imagesAuthenticationAuthScreen),
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 20),
          // Text with many colors
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: "Discover Yourself\n With",
                  style: CustomTextStyle.bold34.copyWith(height: 1.1),
                ),
                TextSpan(
                  text: " Zero Waste",
                  style: CustomTextStyle.bold32.copyWith(
                    fontSize: 30,
                    color: CustomColors.vividGreen5A,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "You are on the right path\n to change your behavior...and earn money",
            textAlign: TextAlign.center,
            style: CustomTextStyle.regular12.copyWith(color: Colors.black),
          ),
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Card(
              color: Colors.white.withOpacity(0),
              elevation: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  authButton(
                    button_color: CustomColors.vividGreen5A,
                    button_text: Text(
                      "Sign in",
                      style:
                          CustomTextStyle.bold16.copyWith(color: Colors.white),
                    ),
                    lift_radius: true,
                    ontaping: () {
                      navigate(
                          context: context, pageScreen: const LoginScreen());
                    },
                  ),
                  authButton(
                    button_color: CustomColors.greyF3,
                    button_text: Text(
                      "Register",
                      style: CustomTextStyle.bold16
                          .copyWith(color: CustomColors.darkGrey52),
                    ),
                    lift_radius: false,
                    ontaping: () {
                      navigate(
                          context: context, pageScreen: const RegisterScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Text with many colors
          Expanded(
            flex: 1,
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "By logging in or registering, you agree to our\n",
                    style: CustomTextStyle.bold10
                        .copyWith(color: CustomColors.vividGreen5A),
                  ),
                  const TextSpan(
                      text: "Terms of Service", style: CustomTextStyle.bold10),
                  TextSpan(
                    text: " and ",
                    style: CustomTextStyle.bold10
                        .copyWith(color: CustomColors.vividGreen5A),
                  ),
                  const TextSpan(
                      text: "Privacy Policy", style: CustomTextStyle.bold10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget authButton({
  required button_text,
  required button_color,
  required lift_radius,
  required ontaping,
}) {
  return Expanded(
    child: InkWell(
      borderRadius: BorderRadius.horizontal(
          left: lift_radius ? const Radius.circular(20) : Radius.zero,
          right: lift_radius ? Radius.zero : const Radius.circular(20)),
      onTap: ontaping,
      child: Container(
        height: 47.0,
        decoration: BoxDecoration(
          color: button_color,
          borderRadius: BorderRadius.horizontal(
            left: lift_radius ? const Radius.circular(20) : Radius.zero,
            right: lift_radius ? Radius.zero : const Radius.circular(20),
          ),
        ),
        child: Center(child: button_text),
      ),
    ),
  );
}
