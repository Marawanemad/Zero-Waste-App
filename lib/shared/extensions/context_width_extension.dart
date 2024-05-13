import 'package:flutter/material.dart';
import 'package:zerowasteapp/shared/helpers/responsive_helper.dart';

extension MediaQueyHelper on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
}

extension Responsive on TextStyle {
  TextStyle responsive(BuildContext context) {
    return copyWith(
        fontSize: responsiveFontSize(context, baseFontSize: fontSize!));
  }
}

extension ResponsiveFontSize on double {
  double getResponsiveFontSize(BuildContext context) =>
      responsiveFontSize(context, baseFontSize: this);
}
