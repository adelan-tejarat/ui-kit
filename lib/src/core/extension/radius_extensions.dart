import 'package:flutter/material.dart';

extension RadiusExtension on num {
  // Create Radius.circular from number
  Radius get radius => Radius.circular(toDouble());

  // Create BorderRadius.all with this number
  BorderRadiusGeometry get all => BorderRadius.all(Radius.circular(toDouble()));

  // Create BorderRadius.only with specific corners
  BorderRadiusGeometry only({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }
}

// BorderSide extension for double values
extension BorderSideExtension on double {
  // Create BorderSide with this width
  BorderSide get border => BorderSide(width: this);

  // Create BorderSide with this width and color
  BorderSide borderWithColor(Color color) => BorderSide(width: this, color: color);
}

// Border extension for quick borders
extension BorderExtension on BorderSide {
  Border get all => Border.all(width: width, color: color);

  Border get onlyTop => Border(top: this);
  Border get onlyBottom => Border(bottom: this);
  Border get onlyLeft => Border(left: this);
  Border get onlyRight => Border(right: this);

  Border vertical({
    BorderSide? top,
    BorderSide? bottom,
  }) {
    return Border(
      top: top ?? this,
      bottom: bottom ?? this,
    );
  }

  Border horizontal({
    BorderSide? left,
    BorderSide? right,
  }) {
    return Border(
      left: left ?? this,
      right: right ?? this,
    );
  }
}
