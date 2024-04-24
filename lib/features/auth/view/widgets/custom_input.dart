import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.size,
    required this.hint,
    required this.obscure,
    required this.keyboardType,
    required this.controller,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;
  final Size size;
  final String hint;
  final bool obscure;
  final TextInputType keyboardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$hint is required';
            } else {
              return null;
            }
          },
          obscureText: obscure,
          onChanged: (value) {
            formKey.currentState!.validate();
          },
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
            ),
            labelText: hint,
            labelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
