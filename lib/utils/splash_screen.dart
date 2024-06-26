import 'package:NextHire/constants/dimensions.dart';
import 'package:NextHire/constants/named_routes.dart';
import 'package:NextHire/themes/color_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../constants/route_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        AppRoute.offNamed(NamedRoutes.logIn);
      } else {
        AppRoute.offNamed(NamedRoutes.mainScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(0, 179, 168, 168),
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Container(
          width: width(context),
          height: height(context),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorStyles.splashGradient1,
                Color.fromARGB(255, 26, 51, 76)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(scaleWidth(20, context)),
                child: Image.asset(
                  "assets/images/page2.png",
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "NextHire",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.all(scaleWidth(8, context)),
                    child: const Text(
                      "we help you find your dream job according to your skillset, location, and preference to build your career",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
