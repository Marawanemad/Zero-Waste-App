import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/authentication/auth_screen.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_divider.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/auth_form_field.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/register_dialog.dart';
import 'package:zero_waste_app/modules/authentication/auth_widgets/social_logins_buttons.dart';
import 'package:zero_waste_app/modules/authentication/register/cubit/register_cubit.dart';
import 'package:zero_waste_app/modules/authentication/register/cubit/register_state.dart';
import 'package:zero_waste_app/modules/home/home_screen/home_screen.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';
import 'package:zero_waste_app/shared/widgets/show_toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();
  bool showErrorIcon = false;

  @override
  Widget build(BuildContext context) {
    // use to access on back from mobile button
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (BuildContext context, RegisterState state) {
          // if (state is RegisterSuccessState) {
          //   if (state.registerModel.status!) {
          //     CacheHelper.setData('token', state.registerModel.token)
          //         .then((value) {
          //       ShowToast(
          //           msg: "Register Success",
          //           colorState: ToastState.success,
          //           toastTimeLength: ToastLengthTime.short);
          //       registerDialog(
          //         context: context,
          //         onPressed: () {
          //           navigateAndFinish(
          //               context: context, pageScreen: const HomeScreen());
          //         },
          //       );
          //     });
          //   }
          // } else {
          //   ShowToast(
          //       msg: "Register Failure",
          //       colorState: ToastState.error,
          //       toastTimeLength: ToastLengthTime.long);
          // }
        },
        builder: (BuildContext context, RegisterState state) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              navigateAndFinish(
                  context: context, pageScreen: const AuthScreen());
            },
            child: Scaffold(
              appBar: defaultAppBar(
                  context: context, pageScreen: const AuthScreen()),
              // use to make expanded with fixed height not infinity
              body: scrollScreenResponsive(
                child: Column(
                  children: [
                    Text("Register",
                        style: CustomTextStyle.bold34
                            .copyWith(color: CustomColors.darkGrey41)),
                    const SizedBox(height: 30),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AuthFormField(
                            controller: nameController,
                            showErrorIcon: showErrorIcon,
                            keyboardType: TextInputType.name,
                            text_input_action: TextInputAction.next,
                            hintText: "Name",
                            validationMessage: '',
                          ),
                          AuthFormField(
                            controller: emailController,
                            showErrorIcon: showErrorIcon,
                            keyboardType: TextInputType.emailAddress,
                            text_input_action: TextInputAction.next,
                            hintText: "Email",
                            validationMessage: '',
                          ),
                          AuthFormField(
                            controller: phoneController,
                            showErrorIcon: showErrorIcon,
                            keyboardType: TextInputType.phone,
                            text_input_action: TextInputAction.next,
                            hintText: "Phone",
                            validationMessage: '',
                          ),
                          AuthFormField(
                            controller: passwordController,
                            showErrorIcon: showErrorIcon,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            text_input_action: TextInputAction.next,
                            hintText: "Password",
                            validationMessage: '',
                          ),
                          AuthFormField(
                            controller: confirmPasswordController,
                            showErrorIcon: showErrorIcon,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            text_input_action: TextInputAction.done,
                            hintText: "Confirm Password",
                            validationMessage: '',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 3),
                    ConditionalBuilder(
                      condition: state is! RegisterLoadingState,
                      builder: (context) => DefaultGreenButton(
                          horizontalPadding: 25,
                          verticalPadding: 8,
                          textSize: 22,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                showErrorIcon = false;
                              });
                              RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  password: passwordController.text);
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
                          text: "Create Account"),
                      fallback: (context) => const Center(
                          child: CircularProgressIndicator(
                        color: CustomColors.vividGreen49,
                      )),
                    ),
                    AuthDivider(text: "Or Sign up With"),
                    SocialLoginButton(
                      // color: CustomColors.vividGreen5A,
                      text: Text(
                        textAlign: TextAlign.center,
                        "Sign up with Google",
                        style: CustomTextStyle.semiBold14.copyWith(
                            color: CustomColors.darkGrey41, fontSize: 15),
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
          );
        },
      ),
    );
  }
}
