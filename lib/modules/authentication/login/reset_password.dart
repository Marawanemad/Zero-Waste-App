import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_form_field.dart';
import 'package:zero_waste_app/modules/authentication/login/login_screen.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';
import 'package:zero_waste_app/shared/widgets/show_toast.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var formKey = GlobalKey<FormState>();

  var newPasswordController = TextEditingController();

  var confirmPasswordController = TextEditingController();
  bool showErrorIcon = false;
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
        body: scrollScreenResponsive(
          child: Column(
            children: [
              Text("Reset Password",
                  style: CustomTextStyle.bold34
                      .copyWith(color: CustomColors.darkGrey41)),
              const Spacer(flex: 2),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AuthFormField(
                      controller: newPasswordController,
                      showErrorIcon: showErrorIcon,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      text_input_action: TextInputAction.next,
                      hintText: "New Password",
                      validationMessage: '',
                    ),
                    AuthFormField(
                      controller: confirmPasswordController,
                      showErrorIcon: showErrorIcon,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      text_input_action: TextInputAction.done,
                      hintText: "Confirm New Password",
                      validationMessage: '',
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
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
                        context: context, pageScreen: const LoginScreen());
                  } else {
                    setState(() {
                      showErrorIcon = true;
                      ShowToast(
                          msg: "Text form field must not be empty",
                          colorState: ToastState.error,
                          toastTimeLength: ToastLengthTime.long);
                    });
                  }
                },
                text: "Confirm Password",
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
