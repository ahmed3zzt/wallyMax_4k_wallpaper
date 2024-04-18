import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app_4k/features/auth/view/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToLogin();
    super.initState();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const AuthPage(), transition: Transition.downToUp);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 42),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/Logo.svg',
                height: 100,
                width: 100,
              ),
            ),
          ),
          Text(
            'WallyMax - 4k Wallpapers',
            style: context.textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(16),
              color: Colors.deepPurple,
            ),
          )
        ],
      ),
    );
  }
}
