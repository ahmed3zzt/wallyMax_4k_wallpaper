import 'package:flutter/material.dart';
import 'package:wallpaper_app_4k/features/auth/view/widgets/auth_body.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBody(),
    );
  }
}
