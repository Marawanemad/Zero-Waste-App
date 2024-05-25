import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/authentication/auth_screen.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets.dart';
import 'package:zero_waste_app/modules/authentication/login/login_screen.dart';
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

  var nameControler = TextEditingController();

  var emailControler = TextEditingController();

  var passwordControler = TextEditingController();

  var confirmPasswordControler = TextEditingController();

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
                              controller: nameControler,
                              keyboardType: TextInputType.name,
                              text_input_action: TextInputAction.next,
                              hintText: "Name",
                              validationMessage: "Name must not be empty"),
                          AuthFormField(
                              controller: emailControler,
                              keyboardType: TextInputType.emailAddress,
                              text_input_action: TextInputAction.next,
                              hintText: "Email",
                              validationMessage: "Email must not be empty"),
                          AuthFormField(
                              controller: passwordControler,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              text_input_action: TextInputAction.next,
                              hintText: "Password",
                              validationMessage: "Please enter your password"),
                          AuthFormField(
                              controller: confirmPasswordControler,
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
                            Dialog(context: context);
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

void Dialog({required context}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (context) => PopScope(
      // to stop return back from mobile button
      canPop: false,
      child: AlertDialog(
        title: const Center(
          child: Text(
            "Sign Up Success",
            style: CustomTextStyle.bold20,
          ),
        ),
        content: const CircleAvatar(
          radius: 60,
          backgroundColor: CustomColors.vividGreen5A,
          child: Icon(
            FontAwesome.check_solid,
            size: 75,
            color: CustomColors.liteGrayCB,
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              navigateAndFinish(
                  context: context, pageScreen: const LoginScreen());
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(30),
              maximumSize: const Size.fromWidth(double.infinity),
              padding: const EdgeInsets.symmetric(vertical: 10),
              side: const BorderSide(color: CustomColors.darkGreen28),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            child: Text(
              "Sign In",
              style: CustomTextStyle.bold20
                  .copyWith(color: CustomColors.darkGreen28),
            ),
          )
        ],
      ),
    ),
  );
}
