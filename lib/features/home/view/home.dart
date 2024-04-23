import 'package:flutter/material.dart';
import 'package:wallpaper_app_4k/core/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Home Page ${authController.firebaseUser.value?.email ?? 'no'} ',
          ),
          Text(authController.firebaseUser.value?.displayName ?? 'No Username'),
          Text(authController.firebaseUser.value?.emailVerified.toString() ??
              'No Username'),
          ElevatedButton(
              onPressed: () {
                authController.firebaseUser.value?.sendEmailVerification();
              },
              child: const Text('Send Email')),
          ElevatedButton(
            child: const Text('Sign Out'),
            onPressed: () => authController.signOut(),
          )
        ],
      ),
    );
  }
}
