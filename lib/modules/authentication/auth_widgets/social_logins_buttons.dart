import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';

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
