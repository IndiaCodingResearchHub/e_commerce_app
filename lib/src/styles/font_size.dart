import 'package:flutter/material.dart';

class fontSizes {
  static double? heading;
  static double? subheading;
  static double? title;
  static double? subtitle;
  static double? sub2title;

  fontSizes(context) {
    var device = MediaQuery.of(context).size.width;
    heading = device > 600.0 ? 45 : 22;
    subheading = device > 600 ? 40 : 20.0;
    title = device > 600.0 ? 36 : 18;
    subtitle = device > 600.0 ? 30 : 15;
    sub2title = device > 600.0 ? 22 : 12;
  }
}
