import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  // Border radius values
  static const double none = 0;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xl2 = 24;
  static const double xl3 = 28;
  static const double xl4 = 32;
  static const double full = 9999;

  // BorderRadiusGeometry objects
  static const noneAll = BorderRadius.all(Radius.circular(none));
  static const xsAll = BorderRadius.all(Radius.circular(xs));
  static const smAll = BorderRadius.all(Radius.circular(sm));
  static const mdAll = BorderRadius.all(Radius.circular(md));
  static const lgAll = BorderRadius.all(Radius.circular(lg));
  static const xlAll = BorderRadius.all(Radius.circular(xl));
  static const xl2All = BorderRadius.all(Radius.circular(xl2));
  static const xl3All = BorderRadius.all(Radius.circular(xl3));
  static const xl4All = BorderRadius.all(Radius.circular(xl4));
  static const fullAll = BorderRadius.all(Radius.circular(full));

  // Helper methods
  static BorderRadiusGeometry only({
    double topLeft = none,
    double topRight = none,
    double bottomLeft = none,
    double bottomRight = none,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }

  static BorderRadiusGeometry vertical({
    double top = none,
    double bottom = none,
  }) {
    return BorderRadius.vertical(
      top: Radius.circular(top),
      bottom: Radius.circular(bottom),
    );
  }

  static BorderRadiusGeometry horizontal({
    double left = none,
    double right = none,
  }) {
    return BorderRadius.horizontal(
      left: Radius.circular(left),
      right: Radius.circular(right),
    );
  }
}
