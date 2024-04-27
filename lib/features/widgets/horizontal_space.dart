import 'package:NextHire/constants/dimensions.dart';
import 'package:flutter/material.dart';


class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key, required this.value, required this.ctx});
  final double value;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: scaleWidth(value, ctx),
    );
  }
}
