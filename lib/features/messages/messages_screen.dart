import 'package:NextHire/constants/dimensions.dart';
import 'package:flutter/material.dart';


class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(24, context),
            vertical: scaleHeight(10, context),
          ),
        ),
      ),
    );
  }
}
