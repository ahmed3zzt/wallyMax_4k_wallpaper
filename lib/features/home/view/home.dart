// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_app_4k/features/home/view/category_page.dart';
import 'package:wallpaper_app_4k/features/home/view/home_screen.dart';
import 'package:wallpaper_app_4k/features/home/view/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryPage(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: _currentIndex),
        screens: _screens,
        items: [
          PersistentBottomNavBarItem(
            inactiveIcon: const Icon(CupertinoIcons.house),
            icon: const Icon(
              CupertinoIcons.house_fill,
            ),
            contentPadding: 5,
            iconSize: 26,
            title: 'Home',
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            activeColorPrimary: Colors.deepPurple,
            inactiveColorPrimary: Colors.white38,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(UniconsSolid.window_grid),
            inactiveIcon: const Icon(UniconsLine.window_grid),
            contentPadding: 5,
            iconSize: 26,
            title: 'Categories',
            activeColorPrimary: Colors.cyan,
            inactiveColorPrimary: Colors.white38,
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(CupertinoIcons.heart_fill),
            inactiveIcon: const Icon(CupertinoIcons.heart),
            contentPadding: 5,
            title: 'Favorites',
            iconSize: 26,
            activeColorPrimary: Colors.red,
            inactiveColorPrimary: Colors.white38,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          PersistentBottomNavBarItem(
            inactiveIcon: const Icon(CupertinoIcons.person),
            icon: const Icon(CupertinoIcons.person_fill),
            title: 'Profile',
            activeColorPrimary: Colors.green,
            contentPadding: 5,
            iconSize: 26,
            inactiveColorPrimary: Colors.white38,
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
        confineToSafeArea: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color.fromARGB(255, 41, 41, 41).withOpacity(0.5),
            blurRadius: 12,
            offset: const Offset(2, 5),
            spreadRadius: 1,
          )
        ]),
    ));
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorites Screen \n Coming Soon We Build It In This Moment'),
    );
  }
}
