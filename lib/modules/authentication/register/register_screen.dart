import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/authentication/auth_screen.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_divider.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_form_field.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_green_button.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/register_dialog.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/social_logins_buttons.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // use to access on back from mobile button
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        navigateAndFinish(context: context, pageScreen: const AuthScreen());
      },
      child: Scaffold(
        appBar: defaultAppBar(context: context, pageScreen: const AuthScreen()),
        // use to make expanded with fixed height not infinity
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Text("Register",
                        style: CustomTextStyle.bold34
                            .copyWith(color: CustomColors.darkGrey73)),
                    const SizedBox(height: 30),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AuthFormField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              text_input_action: TextInputAction.next,
                              hintText: "Name",
                              validationMessage: "Name must not be empty"),
                          AuthFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              text_input_action: TextInputAction.next,
                              hintText: "Email",
                              validationMessage: "Email must not be empty"),
                          AuthFormField(
                              controller: passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              text_input_action: TextInputAction.next,
                              hintText: "Password",
                              validationMessage: "Please enter your password"),
                          AuthFormField(
                              controller: confirmPasswordController,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              text_input_action: TextInputAction.done,
                              hintText: "Confirm Password",
                              validationMessage:
                                  "Please confirm your password"),
                        ],
                      ),
                    ),
                    const Spacer(flex: 3),
                    AuthGreenButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            registerDialog(context: context);
                          }
                        },
                        text: "Create Account"),
                    AuthDivider(text: "Or Sign up With"),
                    SocialLoginButton(
                      // color: CustomColors.vividGreen5A,
                      text: Text(
                        textAlign: TextAlign.center,
                        "Sign up with Google",
                        style: CustomTextStyle.semiBold14.copyWith(
                            color: CustomColors.darkGrey73, fontSize: 15),
                      ),
                      icon: Brand(
                        Brands.google,
                        size: 25,
                      ),
                    ),
                    SocialLoginButton(
                      color: const Color(0xFF1877F2),
                      text: Text(
                        textAlign: TextAlign.center,
                        "Sign up with Facebook",
                        style: CustomTextStyle.semiBold14
                            .copyWith(color: Colors.white, fontSize: 15),
                      ),
                      icon: const Icon(
                        FontAwesome.facebook_f_brand,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
