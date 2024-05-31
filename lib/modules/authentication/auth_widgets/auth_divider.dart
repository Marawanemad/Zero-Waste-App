import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';

Widget AuthDivider({required text}) {
  return Expanded(
    flex: 4,
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    stops: [0.2, 1],
                    colors: [CustomColors.vividGreen5A, Colors.white])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(text),
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    stops: [0.2, 1],
                    colors: [CustomColors.vividGreen5A, Colors.white])),
          ),
        )
      ],
    ),
  );
}
