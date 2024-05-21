import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emilControler = TextEditingController();

  var passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.greyD8),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: CustomColors.black19),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // to make size of screen finite
          height: MediaQuery.sizeOf(context).height * 0.88,
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
                    LoginFormField(
                        controller: emilControler,
                        keyboardtype: TextInputType.emailAddress,
                        text_input_action: TextInputAction.next,
                        hintText: "Username,Email&Phone Number",
                        validiationMesseage: "Email must not be empty"),
                    LoginFormField(
                        controller: passwordControler,
                        obscureText: true,
                        keyboardtype: TextInputType.visiblePassword,
                        text_input_action: TextInputAction.done,
                        hintText: "Password",
                        validiationMesseage: "Please enter your password"),
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
                        onTap: () {},
                        child: Text(
                          "Forgot Password ?",
                          style: CustomTextStyle.regular12.copyWith(
                              color: CustomColors.darkGrey52, fontSize: 16),
                        ))
                  ],
                ),
              ),
              const Spacer(flex: 3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  color: CustomColors.vividGreen5A,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 25.0),
                    child: Text(
                      "Sign in",
                      style: CustomTextStyle.bold20
                          .copyWith(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    GreenLine(leftTOright: true),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Or Sign in With"),
                    ),
                    GreenLine(leftTOright: false)
                  ],
                ),
              ),

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

Widget LoginFormField({
  required hintText,
  bool? obscureText,
  required keyboardtype,
  required text_input_action,
  required controller,
  required validiationMesseage,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    color: CustomColors.greyF3,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
    child: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: formField(
          controller: controller,
          keyboardtype: keyboardtype,
          text_input_action: text_input_action,
          obscureText: obscureText,
          FormBorderShape: InputBorder.none,
          FoucsBorderShape: InputBorder.none,
          hintText: hintText,
          hintStyle: CustomTextStyle.regular12
              .copyWith(color: CustomColors.grey61, fontSize: 16),
          validiationMesseage: validiationMesseage),
    ),
  );
}

Widget GreenLine({required bool leftTOright}) {
  return Expanded(
    child: Container(
      height: 2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: leftTOright ? Alignment.topRight : Alignment.topLeft,
              end: leftTOright ? Alignment.topLeft : Alignment.topRight,
              stops: const [0.2, 1],
              colors: const [CustomColors.vividGreen5A, Colors.white])),
    ),
  );
}

Widget SocialLoginButton({Color? color, required icon, required Widget text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 50.0),
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: BorderSide(color: color ?? CustomColors.vividGreen5A),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              // Adjust this value to position the icon as desired
              left: 10,
              child: icon),
          Center(
            child: text,
          ),
        ],
      ),
    ),
  );
}
