import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_button.dart';
import 'package:zero_waste_app/modules/authentication/login/login_screen.dart';
import 'package:zero_waste_app/modules/authentication/register/register_screen.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';

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
    Future.delayed(
      const Duration(milliseconds: 800),
      () => setState(() => _imageOpacity = 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.liteGreenF1,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 5,
      ),
      // make animation in the page
      body: AnimatedOpacity(
        opacity: _imageOpacity,
        duration: const Duration(seconds: 1),
        child: scrollScreenResponsive(
          child: Column(
            children: [
              // Animated opacity for the image
              Container(
                height: MediaQuery.of(context).size.height *
                    0.4, // Set height to 40% of the screen height
                width: double.infinity,
                // constraints: const BoxConstraints(maxHeight: 200),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.4, 1],
                    colors: [Colors.white, CustomColors.vividGreen61],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: const Image(
                  image: AssetImage(Assets.imagesAuthenticationAuthScreen),
                  fit: BoxFit.contain,
                  // width: double.infinity,
                ),
              ),
              const SizedBox(height: 20),
              // Text with many colors
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 2),
                        blurRadius: 6.0,
                        color: const Color(0x00000000).withOpacity(.15),
                      ),
                    ],
                  ),
                  children: [
                    TextSpan(
                      text: "Discover Yourself\n",
                      style: CustomTextStyle.bold34
                          .copyWith(
                            // height: 1.1,
                            color: const Color(0xFF464444),
                          )
                          .responsive(context),
                    ),
                    TextSpan(
                      text: " With",
                      style: const TextStyle(
                        color: Color(0xFF464444),
                        fontSize: 30,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w700,
                      ).responsive(context),
                    ),
                    TextSpan(
                      text: " Zero Waste",
                      style: CustomTextStyle.bold32
                          .copyWith(
                            fontSize: 30,
                            color: CustomColors.vividGreen5A,
                          )
                          .responsive(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Text(
                "You are on the right path\n to change your behavior...and earn money",
                textAlign: TextAlign.center,
                style: CustomTextStyle.regular12
                    .copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    )
                    .responsive(context),
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  authButton(
                    button_color: CustomColors.vividGreen5A,
                    button_text: Text(
                      "Sign in",
                      style: CustomTextStyle.semiBold18
                          .copyWith(color: Colors.white)
                          .responsive(context),
                    ),
                    lift_radius: true,
                    onTap: () => navigateAndFinish(
                        context: context, pageScreen: const LoginScreen()),
                  ),
                  authButton(
                    button_color: CustomColors.greyF3,
                    button_text: Text(
                      "Register",
                      style: CustomTextStyle.semiBold18
                          .copyWith(color: CustomColors.darkGrey51)
                          .responsive(context),
                    ),
                    lift_radius: false,
                    onTap: () {
                      navigateAndFinish(
                          context: context, pageScreen: const RegisterScreen());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 60),
              // Text with many colors
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: "By logging in or registering, you agree to our\n",
                      style: CustomTextStyle.bold10
                          .copyWith(color: CustomColors.vividGreen5A),
                    ),
                    const TextSpan(
                        text: "Terms of Service",
                        style: CustomTextStyle.bold10),
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
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
