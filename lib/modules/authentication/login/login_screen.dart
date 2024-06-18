import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/authentication/auth_screen.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_divider.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_form_field.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/social_logins_buttons.dart';
import 'package:zero_waste_app/modules/authentication/login/forget_password.dart';
import 'package:zero_waste_app/modules/home/home_screen/home_screen.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  bool showErrorIcon = false;

  @override
  Widget build(BuildContext context) {
    // use to access on back from mobile button
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) =>
          navigateAndFinish(context: context, pageScreen: const AuthScreen()),
      child: Scaffold(
        appBar: defaultAppBar(context: context, pageScreen: const AuthScreen()),
        // use to make expanded with fixed height not infinity
        body: scrollScreenResponsive(
          child: Column(
            children: [
              // Text with many colors
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                        text: "Welcome Back\n",
                        style: CustomTextStyle.bold34
                            .copyWith(color: CustomColors.darkGrey73)),
                    TextSpan(
                        text: " You are doing such a Great Effort",
                        style: CustomTextStyle.regular12.copyWith(
                            color: CustomColors.darkGrey73, fontSize: 17)),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AuthFormField(
                      controller: emailController,
                      showErrorIcon: showErrorIcon,
                      keyboardType: TextInputType.emailAddress,
                      text_input_action: TextInputAction.next,
                      hintText: "Username, Email",
                      validationMessage: '',
                    ),
                    const SizedBox(height: 10),
                    AuthFormField(
                      controller: passwordController,
                      showErrorIcon: showErrorIcon,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      text_input_action: TextInputAction.done,
                      hintText: "Password",
                      validationMessage: '',
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                child: Row(
                  children: [
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          navigate(
                              context: context,
                              pageScreen: const ForgetPasswordScreen());
                        },
                        child: Text(
                          "Forgot Password ?",
                          style: CustomTextStyle.regular12.copyWith(
                              color: CustomColors.darkGrey52, fontSize: 16),
                        ))
                  ],
                ),
              ),
              const Spacer(flex: 3),
              DefaultGreenButton(
                  horizontalPadding: 25,
                  verticalPadding: 8,
                  textSize: 22,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        showErrorIcon = false;
                      });

                      navigateAndFinish(
                          context: context, pageScreen: const HomeScreen());
                    } else {
                      setState(() {
                        showErrorIcon = true;
                      });
                    }
                  },
                  text: "Sign in"),
              AuthDivider(text: "Or Sign in With"),
              SocialLoginButton(
                  // color: CustomColors.vividGreen5A,
                  text: Text(
                    textAlign: TextAlign.center,
                    "Login with Google",
                    style: CustomTextStyle.semiBold14
                        .copyWith(color: CustomColors.darkGrey73, fontSize: 15),
                  ),
                  icon: Brand(
                    Brands.google,
                    size: 25,
                  )),
              SocialLoginButton(
                  color: const Color(0xFF1877F2),
                  text: Text(
                    textAlign: TextAlign.center,
                    "Login with Facebook",
                    style: CustomTextStyle.semiBold14
                        .copyWith(color: Colors.white, fontSize: 15),
                  ),
                  icon: const Icon(
                    FontAwesome.facebook_f_brand,
                    size: 20,
                    color: Colors.white,
                  )),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
