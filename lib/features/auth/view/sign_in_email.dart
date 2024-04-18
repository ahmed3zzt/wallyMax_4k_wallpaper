import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app_4k/features/auth/view/widgets/sign_in_with_email_form.dart';

class SignInWithEmailPage extends StatelessWidget {
  const SignInWithEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
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
                SignInWithEmailForm(
                  size: size,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
