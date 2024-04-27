import 'package:NextHire/constants/named_routes.dart';
import 'package:NextHire/features/auth/presentation/screens/forgot_password.dart';
import 'package:NextHire/features/auth/presentation/screens/login_screen.dart';
import 'package:NextHire/features/auth/presentation/screens/register_screen.dart';
import 'package:NextHire/features/auth/presentation/screens/reset_password.dart';
import 'package:NextHire/features/auth/presentation/screens/verify_code.dart';
import 'package:NextHire/features/full_page_job.dart';
import 'package:NextHire/features/home/home_screen.dart';
import 'package:NextHire/features/main_screen.dart';
import 'package:NextHire/features/saved_jobs_screen.dart';
import 'package:NextHire/utils/splash_screen.dart';
import 'package:NextHire/utils/success_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


class GetAppRoutes {
  GetAppRoutes._();

  static List<GetPage<dynamic>> getAppRoutes() {
    return [
      GetPage(
        name: NamedRoutes.homeScreen,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: NamedRoutes.logIn,
        page: () => const LogIn(),
      ),
      GetPage(
        name: NamedRoutes.registerScreen,
        page: () => const RegisterScreen(),
      ),
      GetPage(
        name: NamedRoutes.splashScreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: NamedRoutes.forgotPassword,
        page: () => const ForgotPassword(),
      ),
      GetPage(
        name: NamedRoutes.resetPassword,
        page: () => ResetPassword(),
      ),
      GetPage(
        name: NamedRoutes.verifyCode,
        page: () => const VerifyCode(),
      ),
      GetPage(
        name: NamedRoutes.successScreen,
        page: () => const SuccessScreen(),
      ),
      GetPage(
        name: NamedRoutes.mainScreen,
        page: () => const MainScreen(),
      ),
      GetPage(
        name: NamedRoutes.fullPageJob,
        page: () => const FullPageJob(),
      ),
      GetPage(
        name: NamedRoutes.savedJobs,
        page: () => SavedJobsScreen(),
      ),
    ];
  }
}
