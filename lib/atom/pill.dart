import 'package:NextHire/constants/dimensions.dart';
import 'package:NextHire/themes/color_styles.dart';
import 'package:flutter/material.dart';


class Pill extends StatelessWidget {
  const Pill(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.c26FFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(16, context),
        vertical: scaleHeight(5, context),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: scaleWidth(11, context),
          color: ColorStyles.pureWhite,
        ),
      ),
    );
  }
}
