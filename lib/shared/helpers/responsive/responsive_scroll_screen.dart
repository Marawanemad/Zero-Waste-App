import 'package:flutter/material.dart';

Widget scrollScreenResponsive({required child}) {
  // use to make expanded with fixed height not infinity
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) =>
        SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
        child: IntrinsicHeight(
            child: Center(
          child: child,
        )),
      ),
    ),
  );
}
