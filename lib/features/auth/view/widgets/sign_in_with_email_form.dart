import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app_4k/core/app_router.dart';
import 'package:wallpaper_app_4k/core/constant.dart';
import 'package:wallpaper_app_4k/features/auth/view/widgets/custom_input.dart';

class SignInWithEmailForm extends StatefulWidget {
  const SignInWithEmailForm({super.key, required this.size});
  final Size size;

  @override
  State<SignInWithEmailForm> createState() => _SignInWithEmailFormState();
}

class _SignInWithEmailFormState extends State<SignInWithEmailForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Sign In With Email',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomInput(
            size: widget.size,
            hint: 'Email',
            obscure: false,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            formKey: _formKey,
          ),
          const SizedBox(
            height: 11,
          ),
          GestureDetector(
            onTap: () {},
            child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Text(
                  'Forgot Password?',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          CustomInput(
            size: widget.size,
            hint: 'Password',
            obscure: true,
            keyboardType: TextInputType.visiblePassword,
            controller: _passwordController,
            formKey: _formKey,
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoute.signUp),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Text(
                  'Don`t Have An Account?',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                authController.login(
                  _emailController.text.trim(),
                  _passwordController.text.trim(),
                );
              }
            },
            child: Container(
              width: widget.size.width * 0.9,
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
                    "Sign In",
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
