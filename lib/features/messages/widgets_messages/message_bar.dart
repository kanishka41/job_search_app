import 'package:NextHire/constants/assets_location.dart';
import 'package:NextHire/constants/strings.dart';
import 'package:NextHire/constants/svg_color.dart';
import 'package:NextHire/themes/color_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MessageBar extends StatelessWidget {
  const MessageBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          StaticText.message,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorStyles.darkTitleColor,
          ),
        ),
        SvgPicture.asset(
          Assets.editSquare,
          width: 21,
          colorFilter: svgColor(
            ColorStyles.splashGradient1,
          ),
        )
      ],
    );
  }
}
