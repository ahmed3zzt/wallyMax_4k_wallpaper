import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_app_4k/features/auth/controller/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  authController.firebaseUser.value!.photoURL == null
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: const BoxDecoration(
                            color: Colors.black38,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.person,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  authController.firebaseUser.value!.photoURL!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  Transform.translate(
                    offset: const Offset(0, -42),
                    child: Text(
                      authController.firebaseUser.value!.displayName ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -42),
                    child: Text(
                      authController.firebaseUser.value!.email ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  CustomProfileButton(
                    icon: const Icon(
                      Icons.code,
                    ),
                    text: 'Developer Profile',
                    onTap: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.custom,
                        barrierDismissible: true,
                        customAsset: 'assets/images/developer_profile.jpg',
                        width: MediaQuery.of(context).size.width * 0.9,
                        widget: const Text(
                          "My Name : Ahmed Ezzt Sabet\nMy Github : ahmed3zzt\nahmedezztsabetdev@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        confirmBtnColor: Colors.deepPurple,
                        confirmBtnText: 'Close',
                        confirmBtnTextStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        title: 'Developer Profile',
                        titleColor: Colors.white,
                        textColor: Colors.white,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomProfileButton(
                    icon: const Icon(
                      UniconsLine.heart,
                    ),
                    text: 'List of Favorites',
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  CustomProfileButton(
                    icon: const Icon(
                      UniconsLine.notes,
                    ),
                    text: 'Terms of Service ',
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  CustomProfileButton(
                    icon: const Icon(
                      UniconsLine.exit,
                    ),
                    text: 'Sign Out',
                    onTap: () {
                      authController.signOut();
                    },
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            UniconsLine.instagram,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black26,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            UniconsLine.github,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            UniconsLine.linkedin,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final Icon icon;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.deepPurple,
                ),
                child: icon),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
