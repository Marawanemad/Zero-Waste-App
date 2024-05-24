import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets.dart';
import 'package:zero_waste_app/modules/authentication/login/login_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/helpers/navigator.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var formKey = GlobalKey<FormState>();

  var newPasswordController = TextEditingController();

  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) =>
          navigateAndFinish(context: context, pageScreen: const LoginScreen()),
      child: Scaffold(
        appBar:
            defaultAppBar(context: context, pageScreen: const LoginScreen()),
        // use to make expanded with fixed height not infinity
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Text("Reset Password",
                        style: CustomTextStyle.bold34
                            .copyWith(color: CustomColors.darkGrey73)),
                    const Spacer(flex: 2),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AuthFormField(
                              controller: newPasswordController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              text_input_action: TextInputAction.next,
                              hintText: "New Password",
                              validationMessage: "Password must not be empty"),
                          AuthFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            text_input_action: TextInputAction.done,
                            hintText: "OTP",
                            validationMessage: "Please Confirm your password",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AuthGreenButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      text: "Confirm Password",
                    ),
                    const Spacer(flex: 4),
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
