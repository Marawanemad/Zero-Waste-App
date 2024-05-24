// to make navigator with replacement can not return back
import 'package:flutter/material.dart';

void navigateAndFinish({required context, required pageScreen}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => pageScreen),
    (route) => false,
  );
}

// to make navigator without replacement can return back
void navigate({required context, required pageScreen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => pageScreen));
}

// to make navigator back to the past screen
void navigateBack({required context}) {
  Navigator.pop(context);
}
