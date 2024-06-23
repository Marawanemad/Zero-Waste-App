import 'package:flutter/material.dart';

Widget authButton({
  required Widget button_text,
  required Color button_color,
  required bool lift_radius,
  required void Function()? onTap,
}) {
  return MaterialButton(
    onPressed: onTap,
    elevation: 5,
    color: button_color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        left: lift_radius ? const Radius.circular(15) : Radius.zero,
        right: lift_radius ? Radius.zero : const Radius.circular(15),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 40),
      child: Center(child: button_text),
    ),
  );
}
