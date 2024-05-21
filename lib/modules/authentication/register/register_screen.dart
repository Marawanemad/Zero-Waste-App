import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var nameControler = TextEditingController();

  var emailControler = TextEditingController();

  var passwordControler = TextEditingController();

  var confirmPasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context),
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
                            controller: emailControler,
                            keyboardtype: TextInputType.name,
                            text_input_action: TextInputAction.next,
                            hintText: "Name",
                            validiationMesseage: "Name must not be empty"),
                        AuthFormField(
                            controller: emailControler,
                            keyboardtype: TextInputType.emailAddress,
                            text_input_action: TextInputAction.next,
                            hintText: "Email",
                            validiationMesseage: "Email must not be empty"),
                        AuthFormField(
                            controller: passwordControler,
                            obscureText: true,
                            keyboardtype: TextInputType.visiblePassword,
                            text_input_action: TextInputAction.next,
                            hintText: "Password",
                            validiationMesseage: "Please enter your password"),
                        AuthFormField(
                            controller: passwordControler,
                            obscureText: true,
                            keyboardtype: TextInputType.visiblePassword,
                            text_input_action: TextInputAction.done,
                            hintText: "Confirm Password",
                            validiationMesseage:
                                "Please confirm your password"),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3),
                  AuthGreenButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      text: "Create Account"),
                  Authdivider(text: "Or Sign up With"),
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
                      )),
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
                      )),
                  const Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
