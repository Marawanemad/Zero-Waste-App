import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/home/profile/profile_widgets/profile_form_field.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  var formKey1 = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var currentPasswordController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  final confirmPasswordFocusNode = FocusNode();

  bool obscureText = true;

  @override
  void dispose() {
    currentPasswordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        centerTitle: true,
        title: Text(
          "About me",
          style: CustomTextStyle.medium18.responsive(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 10),
                child: Text(
                  "Personal Details",
                  style: CustomTextStyle.semiBold18.responsive(context),
                ),
              ),
              Form(
                key: formKey1,
                child: Column(
                  children: [
                    ProfileFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      text_input_action: TextInputAction.next,
                      hintText: "Name",
                      validationMessage: "Name must not be empty",
                      prefixIcon: const Icon(
                        LineAwesome.user_circle_solid,
                        color: CustomColors.grey96,
                      ),
                    ),
                    ProfileFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      text_input_action: TextInputAction.next,
                      hintText: "omaradam9888@gmail.com",
                      validationMessage: "Email must not be empty",
                      prefixIcon: const Icon(
                        IonIcons.mail,
                        color: CustomColors.grey96,
                      ),
                    ),
                    ProfileFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      text_input_action: TextInputAction.next,
                      hintText: "+20 1210 199 141",
                      validationMessage: "Phone must not be empty",
                      prefixIcon: const Icon(
                        LineAwesome.phone_solid,
                        color: CustomColors.grey96,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 10),
                child: Text(
                  "Change Password",
                  style: CustomTextStyle.semiBold18.responsive(context),
                ),
              ),
              Form(
                key: formKey2,
                child: Column(
                  children: [
                    ProfileFormField(
                      controller: currentPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      text_input_action: TextInputAction.next,
                      hintText: "Current Password",
                      obscureText: true,
                      validationMessage: "Password must not be empty",
                      prefixIcon: const Icon(
                        IonIcons.lock_closed,
                        color: CustomColors.grey96,
                      ),
                    ),
                    ProfileFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      text_input_action: TextInputAction.next,
                      hintText: "Password",
                      obscureText: true,
                      validationMessage: "Password must not be empty",
                      prefixIcon: const Icon(
                        IonIcons.lock_closed,
                        color: CustomColors.grey96,
                      ),
                      suffixIcon: Icon(
                        obscureText ? IonIcons.eye : IonIcons.eye_off,
                        color: CustomColors.grey96,
                      ),
                      suffixIconPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      onSubmit: (_) {
                        FocusScope.of(context)
                            .requestFocus(confirmPasswordFocusNode);
                      },
                    ),
                    ProfileFormField(
                      controller: confirmPasswordController,
                      focusNode: confirmPasswordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      text_input_action: TextInputAction.done,
                      hintText: "confirm Password",
                      obscureText: true,
                      validationMessage: "Password must not be empty",
                      prefixIcon: const Icon(
                        IonIcons.lock_closed,
                        color: CustomColors.grey96,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: DefaultGreenButton(
                      text: "Save Settings",
                      onPressed: () {},
                      horizontalPadding: 20,
                      verticalPadding: 14,
                      textSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
