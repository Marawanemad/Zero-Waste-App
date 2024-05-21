import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/enums/screen_sizes.dart';
import 'package:zero_waste_app/shared/extensions/context_width_extension.dart';

double responsiveFontSize(
  BuildContext context, {
  required double baseFontSize,
}) {
  var responsiveFontSize = baseFontSize * getScaleFactor(context);
  var maxSize = baseFontSize * 1.2;
  var minSize = baseFontSize * .8;

  return responsiveFontSize.clamp(minSize, maxSize);
}

double getScaleFactor(BuildContext context) {
  var width = context.width;

  if (width < ScreenConfig.mobile.size) {
    return width / 400;
  } else if (width < ScreenConfig.tablet.size) {
    return width / 1000;
  } else {
    return width / 1500;
  }
}

double responsiveRadius(
  BuildContext context, {
  required double baseRadius,
}) {
  var responsiveRadius = baseRadius * getScaleRadiusFactor(context);
  log(baseRadius.toString());
  log(responsiveRadius.toString());
  var maxSize = baseRadius * 1.0;
  var minSize = baseRadius * .1;
  log("min: ${baseRadius * .5}");
  log(responsiveRadius.clamp(minSize, maxSize).toString());

  return responsiveRadius.clamp(minSize, maxSize);
}

double getScaleRadiusFactor(BuildContext context) {
  var width = context.width;

  if (width < ScreenConfig.mobile.size) {
    log("mobile width activated");
    return width / 1000;
  } else if (width < ScreenConfig.tablet.size) {
    log("tablet width activated");

    return width / 250;
  } else {
    log("pc width activated");

    return width / 1200;
  }
}
