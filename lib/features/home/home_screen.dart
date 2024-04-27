import 'package:NextHire/constants/assets_location.dart';
import 'package:NextHire/constants/dimensions.dart';
import 'package:NextHire/constants/strings.dart';
import 'package:NextHire/features/auth/data/controllers/auth_functions.dart';
import 'package:NextHire/features/widgets/display_card.dart';
import 'package:NextHire/features/widgets/featured_jobs_tile.dart';
import 'package:NextHire/features/widgets/horizontal_space.dart';
import 'package:NextHire/features/widgets/popular_jobs_card.dart';
import 'package:NextHire/features/widgets/profile_header.dart';
import 'package:NextHire/features/widgets/search_job.dart';
import 'package:NextHire/features/widgets/vetical_space.dart';
import 'package:NextHire/themes/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State with SingleTickerProviderStateMixin {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(53, 104, 153, 1),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(0, 0, 0, 0),
                    shape: BoxShape.circle,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    // Navigate to HomeScreen
                    // Note: HomeScreen is the widget containing _HomeScreenState
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.bookmark),
                  title: const Text('Bookmarks'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(24, context),
                  vertical: scaleHeight(28, context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileHeader(
                          lightWelcomeText: StaticText.welcomeBackProfile.tr,
                          boldWelcomeText: StaticText.profileName.tr,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Sign out',
                              middleText: 'Do you really want to sign out?',
                              textCancel: 'No',
                              textConfirm: 'Yes',
                              confirmTextColor: ColorStyles.pureWhite,
                              onConfirm: () {
                                AuthFunctions.signOutUser(context);
                              },
                            );
                          },
                          child: Image.asset(
                            Assets.profileImage,
                          ),
                        ),
                      ],
                    ),
                    VerticalSpace(value: 39, ctx: context),
                    const SearchJob(),
                    VerticalSpace(value: 40, ctx: context),
                    const FeaturedJobsTile(
                      mainText: StaticText.featuredJobs,
                      text: StaticText.seeAll,
                    ),
                  ],
                ),
              ),
              HorizontalSpace(value: 20, ctx: context),

              // JOBS CARD
              SizedBox(
                height: scaleHeight(220, context),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return index % 2 == 0
                        ? Padding(
                            padding:
                                EdgeInsets.only(left: scaleWidth(24, context)),
                            child: const DisplayCard(
                              companyName: StaticText.google,
                              role: StaticText.productManager,
                              salary: '\$200,000/year',
                              location: StaticText.california,
                              color: ColorStyles.c5386E4,
                              logo: Assets.googleSvg,
                            ),
                          )
                        : Padding(
                            padding:
                                EdgeInsets.only(left: scaleWidth(24, context)),
                            child: const DisplayCard(
                              companyName: StaticText.facebook,
                              role: StaticText.softwareEngineer,
                              salary: '\$180,000/year',
                              location: StaticText.california,
                              color: Color.fromRGBO(53, 104, 153, 1),
                              logo: Assets.facebookSvg,
                            ),
                          );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(
                  scaleWidth(24, context),
                  scaleHeight(42, context),
                  scaleWidth(24, context),
                  scaleHeight(16, context),
                ),

                // RECOMMENDED JOBS
                child: Column(
                  children: [
                    const FeaturedJobsTile(
                      mainText: StaticText.popularJobs,
                      text: StaticText.seeAll,
                    ),
                    VerticalSpace(
                      value: 20,
                      ctx: context,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopularJobsCard(
                          logo: Assets.googleSvg,
                          company: StaticText.facebook,
                          role: 'Sr. Engineer',
                          salary: '\$180,000/y',
                          color: ColorStyles.cFFEBF3,
                        ),
                        PopularJobsCard(
                          logo: Assets.facebookSvg,
                          company: StaticText.facebook,
                          role: 'UI Designer',
                          salary: '\$110,000/y',
                          color: ColorStyles.cEBF1FF,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
