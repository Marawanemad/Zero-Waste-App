import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/widgets/navigator.dart';

PreferredSizeWidget defaultAppBar(
    {required context,
    Widget? leading,
    Widget? title,
    List<Widget>? actionWidgetsList}) {
  return AppBar(
    elevation: 0,
    leading: leading ??
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              navigateBack(context: context);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.greyD8),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: CustomColors.black19),
            ),
          ),
        ),
    title: title,
    actions: actionWidgetsList,
  );
}
