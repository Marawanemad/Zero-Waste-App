import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

Widget dropDownRow(
    {required context,
    required iconName,
    required hintText,
    required selectedCountry,
    required onChange,
    required dropDownList}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, top: 10),
    child: Row(
      children: [
        Icon(iconName, color: CustomColors.grey96),
        const SizedBox(width: 20),
        DropdownButton(
          elevation: 9,
          padding: const EdgeInsets.only(right: 20),
          hint: hintText,
          iconEnabledColor: CustomColors.grey96,
          underline: const SizedBox(),
          value: selectedCountry,
          onChanged: onChange,
          items: dropDownList.map<DropdownMenuItem<String>>((String country) {
            return DropdownMenuItem<String>(
              value: country,
              child: Text(
                country,
                style: CustomTextStyle.medium18.responsive(context),
              ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}
