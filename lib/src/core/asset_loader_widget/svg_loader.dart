import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:flutter/material.dart';

class LoaderSvgAsset extends StatelessWidget {
  const LoaderSvgAsset(
      this.assetAddress, {
        super.key,
        this.width,
        this.height,
        this.color,
        this.fit = BoxFit.contain,
      });

  final String assetAddress;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetAddress,
      package: 'vamstreet_uikit',
      width: width,
      height: height,
      color: color,
      fit: fit,
    );
  }
}