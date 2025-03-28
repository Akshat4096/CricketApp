import 'package:ny_cricket_app/app/ui/pages/authentication/presentation/forgot_password_page.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/presentation/otp_verification_page.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/presentation/reset_password_page.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/presentation/signin_page.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/presentation/signup_page.dart';
import 'package:ny_cricket_app/app/ui/pages/home/presentation/home_page.dart';
import 'package:ny_cricket_app/app/ui/pages/home/presentation/live/live_match_detail_page.dart';
import 'package:ny_cricket_app/app/ui/pages/home/presentation/live/quiz_page.dart';
import 'package:ny_cricket_app/app/ui/pages/onboarding/presentation/onboarding_screen.dart';
import 'package:ny_cricket_app/app/ui/pages/onboarding/presentation/onboarding_start_page.dart';
import 'package:ny_cricket_app/app/ui/pages/profile/presentation/profile_page.dart';
import 'package:ny_cricket_app/app/ui/pages/splash/pages/splash_page.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class AppPages {
  static final routes = [
    // Login Page
    GetPage(
      name: AppRoutes.login,
      page: () => const SigninPage(),
    ),
    // Registration Page
    GetPage(
      name: AppRoutes.register,
      page: () => const SignUpPage(),
    ),
    // Forgot Password Page
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordPage(),
    ),
    // Verification Code Page
    GetPage(
      name: AppRoutes.verifyCode,
      page: () => const OtpVerificationPage(),
    ),
    // Reset Password Page
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordPage(),
    ),
    GetPage(
      name: AppRoutes.onboardingPage,
      page: () => const OnboardingPages(),
    ),
    GetPage(
      name: AppRoutes.onboardingstartPage,
      page: () => const OnboardingPage(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: AppRoutes.liveMatchDetailsPage,
      page: () => LiveMatchDetailsPage(),
    ),
    GetPage(
      name: AppRoutes.quizPage,
      page: () => QuizPage(),
    ),
  ];
}
