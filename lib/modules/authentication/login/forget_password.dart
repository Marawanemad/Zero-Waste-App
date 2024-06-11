import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_form_field.dart';
import 'package:zero_waste_app/modules/authentication/login/reset_password.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with SingleTickerProviderStateMixin {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var otpController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _animation;
  int _remainingSeconds = 30;
  Timer? timer;
  bool _isRotating = false;

// to make initial animation rotate for refresh icon

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    // to start animation with reverse direction
    _animation = Tween<double>(begin: 1, end: -1).animate(_controller);
  }

// to stop animation
  @override
  void dispose() {
    _controller.stop(); // Stop the animation controller
    _controller.dispose(); // Dispose the animation controller
    timer?.cancel(); // Cancel the timer if it's still running
    super.dispose(); // Call the superclass's dispose method
  }

// method to start animation when call it
  void _onPressed() {
    if (!_isRotating) {
      _controller.repeat();
      setState(() {
        _isRotating = true;
      });

      // Start the timer to stop the animation after 30 seconds
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _remainingSeconds--;
          if (_remainingSeconds <= 0) {
            _controller.stop();
            timer.cancel();
            _isRotating = false;
            _remainingSeconds = 30;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return Scaffold(
      appBar: defaultAppBar(context: context),
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
                        Row(
                          children: [
                            Expanded(
                              child: AuthFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  text_input_action: TextInputAction.next,
                                  hintText: "Email",
                                  validationMessage: "Email must not be empty"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: IconButton(
                                style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                      CustomColors.vividGreen5A),
                                ),
                                onPressed: () {},
                                // to make icon in opposite direction
                                icon: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AuthFormField(
                                controller: otpController,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                text_input_action: TextInputAction.done,
                                hintText: "OTP",
                                validationMessage: "Please enter your OTP",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 15.0),
                              child: Column(children: [
                                IconButton(
                                  style: const ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                    backgroundColor: WidgetStatePropertyAll(
                                        CustomColors.vividGreen5A),
                                  ),
                                  onPressed: _remainingSeconds == 30
                                      ? _onPressed
                                      : null,
                                  // to make animation rotate
                                  icon: RotationTransition(
                                    turns: _animation,
                                    child: Transform(
                                      alignment: Alignment.center,
                                      // Rotate the icon 180 degrees around the Y-axis
                                      transform: Matrix4.rotationY(3.14159),
                                      child: const Icon(
                                        Icons.refresh_outlined,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                ),
                                Text("00:$seconds")
                              ]),
                            ),
                          ],
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
                          navigateAndFinish(
                              context: context,
                              pageScreen: const ResetPasswordScreen());
                        }
                      },
                      text: "Verify"),
                  const Spacer(flex: 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
