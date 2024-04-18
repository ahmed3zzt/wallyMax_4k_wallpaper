import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          ),
          const SizedBox(
            height: 22,
          ),
          CustomInput(
            size: widget.size,
            hint: 'Password',
            obscure: true,
            keyboardType: TextInputType.visiblePassword,
            controller: _passwordController,
          ),
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: widget.size.width * 0.9,
              height: 48,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
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

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.size,
    required this.hint,
    required this.obscure,
    required this.keyboardType,
    required this.controller,
  });

  final Size size;
  final String hint;
  final bool obscure;
  final TextInputType keyboardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
            spreadRadius: 1,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextFormField(
          obscureText: obscure,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
