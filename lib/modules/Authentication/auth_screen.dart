// import 'package:flutter/material.dart';
// import 'package:zero_waste_app/shared/assets.dart';
// import 'package:zero_waste_app/shared/themes/colors.dart';
// import 'package:zero_waste_app/shared/themes/font_styles.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   @override
//   Widget build(Build) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         toolbarHeight: 5,
//       ),
//       body: Column(
//         children: [
//           // make animation shape when start screen
//           AnimatedCrossFade(
//             crossFadeState: CrossFadeState.showFirst,
//             duration: Duration(seconds: 1),
//             // image with circular radius
//             firstChild: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       // to divided the gradient color
//                       stops: [0.2, 1],
//                       colors: [Colors.white, CustomColors.vividGreen61]),
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(40),
//                       bottomRight: Radius.circular(40))),
//               child: Image(
//                   image: AssetImage(Assets.imagesAuthentication1),
//                   width: double.infinity),
//             ),
//             secondChild: SizedBox(),
//           ),
//           SizedBox(height: 25),
//           // Text with many colors
//           Text.rich(
//             textAlign: TextAlign.center,
//             TextSpan(children: [
//               TextSpan(
//                 text: "Discover Yourself\n With",
//                 style: CustomTextStyle.bold34.copyWith(height: 1.1),
//               ),
//               TextSpan(
//                 text: " Zero Waste",
//                 style: CustomTextStyle.bold32
//                     .copyWith(fontSize: 30, color: CustomColors.vividGreen5A),
//               ),
//             ]),
//           ),
//           SizedBox(height: 25),
//           Text(
//             "You are on the right path\n to change tour behavior...and earn money",
//             textAlign: TextAlign.center,
//             style: CustomTextStyle.regular12.copyWith(color: Colors.black),
//           ),
//           Spacer(),
//           // make two buttons
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 50),
//             child: Card(
//               color: Colors.white.withOpacity(0),
//               elevation: 5,
//               child:
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 authButton(
//                     button_color: CustomColors.vividGreen5A,
//                     button_text: Text("Sign in",
//                         style: CustomTextStyle.bold16
//                             .copyWith(color: Colors.white)),
//                     lift_radius: true),
//                 authButton(
//                     button_color: CustomColors.greyF3,
//                     button_text: Text("Register",
//                         style: CustomTextStyle.bold16
//                             .copyWith(color: CustomColors.darkGrey52)),
//                     lift_radius: false)
//               ]),
//             ),
//           ),
//           Spacer(),
//           // Text with many colors
//           Text.rich(
//             textAlign: TextAlign.center,
//             TextSpan(children: [
//               TextSpan(
//                 text: "By logging in or registering, you agree to our\n",
//                 style: CustomTextStyle.bold10
//                     .copyWith(color: CustomColors.vividGreen5A),
//               ),
//               TextSpan(text: "Terms of Service", style: CustomTextStyle.bold10),
//               TextSpan(
//                   text: " and ",
//                   style: CustomTextStyle.bold10
//                       .copyWith(color: CustomColors.vividGreen5A)),
//               TextSpan(text: "Privacy Policy", style: CustomTextStyle.bold10),
//             ]),
//           ),
//           SizedBox(height: 25)
//         ],
//       ),
//     );
//   }
// }

// Widget authButton({
//   required Text button_text,
//   required Color button_color,
//   required bool lift_radius,
// }) {
//   return Expanded(
//     child: InkWell(
//       onTap: () {},
//       child: Container(
//         child: Center(child: button_text),
//         height: 47.0,
//         decoration: BoxDecoration(
//           color: button_color,
//           borderRadius: BorderRadius.horizontal(
//             left: lift_radius ? Radius.circular(20) : Radius.zero,
//             right: lift_radius ? Radius.zero : Radius.circular(20),
//           ),
//         ),
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/extensions/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

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
    Future.delayed(const Duration(milliseconds: 800), () {
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
      body: AnimatedOpacity(
        opacity: _imageOpacity,
        duration: const Duration(seconds: 1),
        child: Column(
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
            const SizedBox(height: 25),
            // Text with many colors
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Discover Yourself\n With",
                    style: CustomTextStyle.bold34
                        .copyWith(height: 1.1)
                        .responsive(context),
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
            const SizedBox(height: 25),
            Text(
              "You are on the right path\n to change your behavior...and earn money",
              textAlign: TextAlign.center,
              style: CustomTextStyle.regular12
                  .copyWith(color: Colors.black)
                  .responsive(context),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Card(
                color: Colors.white.withOpacity(0),
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    authButton(
                      buttonColor: CustomColors.vividGreen5A,
                      buttonText: Text(
                        "Sign in",
                        style: CustomTextStyle.bold16
                            .copyWith(color: Colors.white)
                            .responsive(context),
                      ),
                      liftRadius: true,
                    ),
                    authButton(
                      buttonColor: CustomColors.greyF3,
                      buttonText: Text(
                        "Register",
                        style: CustomTextStyle.bold16
                            .copyWith(color: CustomColors.darkGrey52)
                            .responsive(context),
                      ),
                      liftRadius: false,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
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
                    style: CustomTextStyle.bold10,
                  ),
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
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

Widget authButton({
  required Text buttonText,
  required Color buttonColor,
  required bool liftRadius,
}) {
  return Expanded(
    child: InkWell(
      onTap: () {},
      child: Container(
        height: 47.0,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.horizontal(
            left: liftRadius ? const Radius.circular(20) : Radius.zero,
            right: liftRadius ? Radius.zero : const Radius.circular(20),
          ),
        ),
        child: Center(child: buttonText),
      ),
    ),
  );
}