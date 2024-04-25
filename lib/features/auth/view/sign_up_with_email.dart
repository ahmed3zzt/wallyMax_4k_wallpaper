import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app_4k/core/app_router.dart';
import 'package:wallpaper_app_4k/features/auth/view/widgets/sign_up_with_email_form.dart';

class SignUpWithEmail extends StatelessWidget {
  const SignUpWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.offAllNamed(AppRoute.auth),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
            )),
      ),
      body: SizedBox(
        height: size.height * 0.9,
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height * 0.9,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/Logo.svg',
                    height: 80,
                    width: 80,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'WallyMax Wallpaper App',
                  style: context.textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 32,
                ),
                const SignUpWithEmailForm(),
                const Spacer(),
                SizedBox(
                  width: size.width * 0.8,
                  child: const Center(
                      child: Text(
                    'By signing in you agree to our  Terms of Service and Privacy Policy',
                    textAlign: TextAlign.center,
                  )),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
