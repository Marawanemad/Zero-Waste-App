import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';

PreferredSizeWidget defaultAppBar({
  required context,
  Widget? leading,
  Widget? title,
  Color? appBarColor,
  double? appBarHeight,
  List<Widget>? actionWidgetsList,
  centerTitle = false,
  pageScreen,
}) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight ?? 0),
        child: const SizedBox()),
    elevation: 0,
    backgroundColor: appBarColor,
    titleSpacing: appBarHeight,
    leading: leading ??
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              pageScreen == null
                  ? navigateBack(context: context)
                  : navigateAndFinish(context: context, pageScreen: pageScreen);
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
    centerTitle: centerTitle,
  );
}
