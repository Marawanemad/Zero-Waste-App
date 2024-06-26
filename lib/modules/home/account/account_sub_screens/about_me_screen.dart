import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/home/account/account_widgets/account_form_field.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/data/local/shared_pref_keys_enum.dart';
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
        appBarColor: Colors.white,
        appBarHeight: 25,
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
                      context: context,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      text_input_action: TextInputAction.next,
                      hintText:
                          CacheHelper.cachedData[SharedPrefKeys.getName.key],
                      validationMessage: "Name must not be empty",
                      prefixIcon: const Icon(
                        LineAwesome.user_circle_solid,
                        color: CustomColors.grey96,
                      ),
                    ),
                    ProfileFormField(
                      context: context,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      text_input_action: TextInputAction.next,
                      hintText:
                          CacheHelper.cachedData[SharedPrefKeys.getEmail.key],
                      validationMessage: "Email must not be empty",
                      prefixIcon: const Icon(
                        IonIcons.mail,
                        color: CustomColors.grey96,
                      ),
                    ),
                    ProfileFormField(
                      context: context,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      text_input_action: TextInputAction.next,
                      hintText:
                          CacheHelper.cachedData[SharedPrefKeys.getPhone.key],
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
                      context: context,
                      controller: currentPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      text_input_action: TextInputAction.next,
                      hintText: "Current Password",
                      obscureText: true,
                      validationMessage: "Password must not be empty",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Icon(
                          size: 25,
                          IonIcons.lock_closed,
                          color: CustomColors.grey96,
                        ),
                      ),
                    ),
                    ProfileFormField(
                      context: context,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      text_input_action: TextInputAction.next,
                      hintText: "Password",
                      obscureText: obscureText,
                      validationMessage: "Password must not be empty",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Icon(
                          IonIcons.lock_closed,
                          color: CustomColors.grey96,
                        ),
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
                      context: context,
                      controller: confirmPasswordController,
                      focusNode: confirmPasswordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      text_input_action: TextInputAction.done,
                      hintText: "Confirm Password",
                      obscureText: true,
                      validationMessage: "Password must not be empty",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Icon(
                          IonIcons.lock_closed,
                          color: CustomColors.grey96,
                        ),
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
                      onPressed: () {
                        setState(() {
                          nameController.text != ''
                              ? CacheHelper.setData(SharedPrefKeys.getName.key,
                                  nameController.text)
                              : null;
                          emailController.text != ''
                              ? CacheHelper.setData(SharedPrefKeys.getEmail.key,
                                  emailController.text)
                              : null;
                          phoneController.text != ''
                              ? CacheHelper.setData(SharedPrefKeys.getPhone.key,
                                  phoneController.text)
                              : null;
                        });
                      },
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
