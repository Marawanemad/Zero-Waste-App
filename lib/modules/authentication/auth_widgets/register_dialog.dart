import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/authentication/login/login_screen.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

void registerDialog({required context}) {
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
            color: CustomColors.liteGreyCB,
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
