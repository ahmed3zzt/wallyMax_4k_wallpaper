import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class SignInButton extends StatelessWidget {
  SignInButton({
    super.key,
    required this.size,
    required this.buttonText,
    required this.buttonIconUrl,
    required this.buttonColor,
    this.textWhite = false,
    this.onTap,
  });

  final Size size;
  final String buttonText;
  final String buttonIconUrl;
  final Color buttonColor;
  bool textWhite;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.8,
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
          color: buttonColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: size.width * 0.05),
              SvgPicture.asset(
                buttonIconUrl,
                height: 32,
                width: 32,
              ),
              SizedBox(width: size.width * 0.05),
              Text(
                buttonText,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textWhite ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
