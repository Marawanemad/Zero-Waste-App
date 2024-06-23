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
  return Container(
    padding: const EdgeInsets.only(top: 10, left: 8.0, bottom: 5),
    margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.white),
    child: Row(
      children: [
        Icon(
          iconName,
          color: CustomColors.grey96,
          size: 25,
        ),
        Container(
          margin: const EdgeInsets.only(left: 18, bottom: 5),
          width: MediaQuery.of(context).size.width * 0.8,
          child: DropdownButton(
            isExpanded: true,
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
        ),
      ],
    ),
  );
}
