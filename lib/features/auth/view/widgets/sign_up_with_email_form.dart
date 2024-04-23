import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wallpaper_app_4k/core/app_router.dart';
import 'package:wallpaper_app_4k/core/constant.dart';
import 'package:wallpaper_app_4k/features/auth/view/widgets/custom_input.dart';

class SignUpWithEmailForm extends StatelessWidget {
  const SignUpWithEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            'Sign Up With Email',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 28,
          ),
          CustomInput(
            size: size,
            hint: 'Username',
            obscure: false,
            keyboardType: TextInputType.text,
            controller: usernameController,
            formKey: formKey,
          ),
          const SizedBox(
            height: 22,
          ),
          CustomInput(
            size: size,
            hint: 'Email',
            obscure: false,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            formKey: formKey,
          ),
          const SizedBox(
            height: 22,
          ),
          CustomInput(
            size: size,
            hint: 'Password',
            obscure: true,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            formKey: formKey,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoute.signIn),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Text(
                  'Already have an account?',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () {
              if (!formKey.currentState!.validate()) {}

              authController.register(
                emailController.text.trim(),
                passwordController.text.trim(),
                usernameController.text.trim(),
              );
            },
            child: Container(
              width: size.width * 0.9,
              height: 48,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 41, 41, 41).withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                    spreadRadius: 1,
                  )
                ],
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
