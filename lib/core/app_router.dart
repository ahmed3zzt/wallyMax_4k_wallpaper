import 'package:get/route_manager.dart';
import 'package:wallpaper_app_4k/features/auth/view/auth.dart';
import 'package:wallpaper_app_4k/features/auth/view/sign_in_email.dart';
import 'package:wallpaper_app_4k/features/auth/view/sign_up_with_email.dart';
import 'package:wallpaper_app_4k/features/home/view/home.dart';
import 'package:wallpaper_app_4k/features/splash/views/splash.dart';

class AppRoute {
  static List<GetPage> getPages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: auth, page: () => const AuthPage()),
    GetPage(name: signIn, page: () => const SignInWithEmailPage()),
    GetPage(name: signUp, page: () => const SignUpWithEmail()),
    GetPage(name: splash, page: () => const SplashScreen()),
  ];

  static const String home = '/home';
  static const String auth = '/auth';
  static const String signIn = '/signIn';
  static const String signUp = '/signUP';
  static const String splash = '/splash';
  static const String search = '/search';
}
