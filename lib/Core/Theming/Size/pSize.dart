import 'package:flutter/material.dart';

class size {
  static SizedBox height(double height) => SizedBox(
        height: height,
      );
  static SizedBox width(double width) => SizedBox(width: width);
}

double width(context) => MediaQuery.of(context).size.width;
double height(context) => MediaQuery.of(context).size.height;
