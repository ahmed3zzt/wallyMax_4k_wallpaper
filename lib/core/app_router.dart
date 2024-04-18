import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wallpaper_app_4k/features/auth/view/auth.dart';
import 'package:wallpaper_app_4k/features/splash/views/splash.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetPageRoute(
          page: () => const SplashScreen(),
        );
      case '/login':
        return GetPageRoute(
          page: () => const AuthPage(),
        );

      default:
        return _notFoundPage();
    }
  }

  static Route<dynamic> _notFoundPage() {
    return GetPageRoute(
      page: () => const Scaffold(
        body: Center(
          child: Text('Page not found 404'),
        ),
      ),
    );
  }
}
