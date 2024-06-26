import 'package:NextHire/constants/get_app_routes.dart';
import 'package:NextHire/constants/strings.dart';
import 'package:NextHire/themes/color_styles.dart';
import 'package:NextHire/themes/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'app_translation.dart';
import 'constants/named_routes.dart';

class JobSearchApp extends StatefulWidget {
  const JobSearchApp({super.key});

  @override
  State<JobSearchApp> createState() => _JobSearchAppState();
}

class _JobSearchAppState extends State<JobSearchApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StaticText.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorStyles.defaultMainColor,
        fontFamily: FontStyles.fontFamily,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: ColorStyles.darkTitleColor,
          ),
        ),
      ),
      initialRoute: NamedRoutes.splashScreen,
      getPages: GetAppRoutes.getAppRoutes(),
      locale: Get.deviceLocale,
      translationsKeys: AppTranslation.translationKeys,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
