import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app_4k/core/app_router.dart';
import 'package:wallpaper_app_4k/core/constant.dart';
import 'package:wallpaper_app_4k/features/auth/view/widgets/sign_in_button.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.9,
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 42),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/Logo.svg',
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              Text(
                'WallyMax Wallpaper App',
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 32,
              ),
              SignInButton(
                size: size,
                buttonText: 'Continue with Google',
                buttonIconUrl: 'assets/images/google.svg',
                buttonColor: Colors.white,
                onTap: () {
                  authController.signInWithGoogle();
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SignInButton(
                size: size,
                buttonText: 'Continue with Facebook',
                buttonIconUrl: 'assets/images/facebook.svg',
                buttonColor: Colors.blue.shade800,
                textWhite: true,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                'or continue with ',
                style: context.textTheme.bodyLarge,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SignInButton(
                size: size,
                buttonText: 'Continue with Email',
                buttonIconUrl: 'assets/images/gmail.svg',
                buttonColor: Colors.red.shade800,
                textWhite: true,
                onTap: () => Get.toNamed(AppRoute.signIn),
              ),
              const Spacer(),
              SizedBox(
                width: size.width * 0.8,
                child: const Center(
                    child: Text(
                  'By signing in you agree to our  Terms of Service and Privacy Policy',
                  textAlign: TextAlign.center,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
