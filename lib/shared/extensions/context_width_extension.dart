import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/helpers/responsive_helper.dart';

extension MediaQueyHelper on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
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
