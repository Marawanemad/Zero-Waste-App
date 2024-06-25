import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';

// to show alert message
void ShowToast(
    {required String msg,
    required ToastState colorState,
    required ToastLengthTime toastTimeLength}) {
  Fluttertoast.showToast(
    msg: msg,
    // to show the time of message in android long =5sec , short=1sec
    toastLength: chooseToastLength(toastTimeLength),
    // to show the time of message in web and IOS
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(colorState),
    fontSize: 15,
    // gravity: ToastGravity.CENTER,
    textColor: Colors.white,
  );
}

// enum to choose from multiple state
enum ToastState { success, error, warning }

enum ToastLengthTime { long, short }

// to choose Time depending on toastLengthTime
chooseToastLength(ToastLengthTime state) {
  switch (state) {
    case ToastLengthTime.long:
      return Toast.LENGTH_LONG;
    case ToastLengthTime.short:
      return Toast.LENGTH_SHORT;
  }
}

// to choose color depending on colorState
Color chooseToastColor(ToastState colorState) {
  switch (colorState) {
    case ToastState.success:
      return CustomColors.vividGreen49;
    case ToastState.error:
      return CustomColors.red05;
    case ToastState.warning:
      return CustomColors.yellow3A;
  }
}
