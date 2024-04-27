import 'package:NextHire/constants/assets_location.dart';
import 'package:NextHire/constants/dimensions.dart';
import 'package:NextHire/constants/named_routes.dart';
import 'package:NextHire/constants/strings.dart';
import 'package:NextHire/features/auth/data/controllers/validation.dart';
import 'package:NextHire/features/auth/presentation/widgets/login_button.dart';
import 'package:NextHire/features/auth/presentation/widgets/text_fields.dart';
import 'package:NextHire/features/widgets/custom_progress_indicator.dart';
import 'package:NextHire/features/widgets/vetical_space.dart';
import 'package:NextHire/themes/color_styles.dart';
import 'package:NextHire/themes/font_styles.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/controllers/auth_functions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isMobile = false;
  bool isEmail = true;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Country _country = Country(
    phoneCode: '91',
    countryCode: '91',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: 'India',
    e164Key: '',
  );

  // final TextEditingController emailController;
  final TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(42, context),
            vertical: scaleHeight(24, context),
          ),
          children: [
            VerticalSpace(
              value: 83,
              ctx: context,
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NextHire",
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color(0xFF356899),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            VerticalSpace(
              value: 4.73,
              ctx: context,
            ),

            Text(
              StaticText.forgotPassword,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: scaleHeight(24, context),
                fontWeight: FontWeight.w600,
                color: ColorStyles.darkTitleColor,
              ),
            ),

            VerticalSpace(
              value: 16,
              ctx: context,
            ),

            const Text(
              StaticText.enterMailPhone,
              textAlign: TextAlign.center,
              style: FontStyles.lightStyle,
            ),

            VerticalSpace(
              value: 96,
              ctx: context,
            ),

            // * Email and Password buttons
            Column(
              children: [
                Container(
                  height: scaleHeight(
                    47,
                    context,
                  ),
                  decoration: BoxDecoration(
                    color: ColorStyles.forgotMailPassColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: scaleWidth(
                        7,
                        context,
                      ),
                      vertical: scaleHeight(
                        6,
                        context,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: scaleHeight(
                              43,
                              context,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                scaleRadius(
                                  16,
                                  context,
                                ),
                              ),
                              color: isEmail
                                  ? Colors.white
                                  : ColorStyles.forgotMailPassColor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Change state of buttons here
                                setState(() {
                                  isMobile = false;
                                  isEmail = true;
                                });
                              },
                              child: const Center(
                                child: Text(
                                  StaticText.email,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: scaleHeight(
                              43,
                              context,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                scaleRadius(16, context),
                              ),
                              color: isMobile
                                  ? Colors.white
                                  : ColorStyles.forgotMailPassColor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Change state of buttons here
                                setState(() {
                                  isMobile = true;
                                  isEmail = false;
                                });
                              },
                              child: const Center(
                                child: Text(
                                  StaticText.mobileNumber,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSpace(
                  value: 48,
                  ctx: context,
                ),
                if (isEmail)
                  CustomTextField(
                    hintText: StaticText.email,
                    textIcon: Assets.mailOutlineSvg,
                    isPassword: false,
                    textType: TextInputType.emailAddress,
                    controller: TextEditingController(),
                    isErrorfull: false,
                    inputType: InputType.email,
                    formKey: _formKey,
                  ),
                if (isMobile)
                  TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    controller: mobileController,
                    style: TextStyle(
                      letterSpacing: scaleWidth(5, context),
                      fontWeight: FontWeight.w500,
                    ),
                    scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom +
                          scaleHeight(48, context),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: scaleWidth(
                          24,
                          context,
                        ),
                        vertical: scaleHeight(
                          16,
                          context,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          scaleRadius(
                            10,
                            context,
                          ),
                        ),
                      ),

                      // This is not applying color
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(scaleRadius(10, context)),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      prefixStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      hintText: StaticText.mobileNumber,
                      hintStyle: const TextStyle(
                        letterSpacing: 1,
                      ),
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  bottomSheetHeight: scaleHeight(400, context),
                                ),
                                onSelect: (value) {
                                  setState(
                                    () {
                                      _country = value;
                                    },
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: scaleWidth(8, context),
                                right: scaleWidth(12, context),
                              ),
                              child: Text(
                                '+ ${_country.phoneCode}',
                                style: TextStyle(
                                  fontSize: scaleWidth(16, context),
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          Assets.phoneSvg,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            VerticalSpace(
              value: 24,
              ctx: context,
            ),
            if (isLoading == true) ...{
              VerticalSpace(value: 15, ctx: context),
              const CustomProgressIndicator(),
            } else
              LoginButton(
                loginText: StaticText.sendCode,
                onTapButton: () async {
                  setState(() {
                    isLoading = true;
                  });

                  await AuthFunctions.onClickSendCode(
                    mobileController: mobileController,
                    context: context,
                  );

                  // WHEN I MAKE IT FALSE IT DOESN'T SHOW A LOADER
                  // BUT IT SHOULD SHOW TILL FUNC CALLS

                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            VerticalSpace(value: 24, ctx: context),

            TextButton(
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  NamedRoutes.resetPassword,
                );
              },
              child: const Text(StaticText.resetPassword),
            )
          ],
        ),
      ),
    );
  }
}
