import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
      {super.key, required this.iconPath, this.width = 32, this.height = 32});
  final String iconPath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: width,
      height: height,
    );
  }
}
