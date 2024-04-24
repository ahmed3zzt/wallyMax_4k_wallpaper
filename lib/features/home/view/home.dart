import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_app_4k/features/home/view/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
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
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color.fromARGB(255, 41, 41, 41).withOpacity(0.5),
            blurRadius: 12,
            offset: const Offset(2, 5),
            spreadRadius: 1,
          )
        ]),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style9, // Choose the desired style
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Screen'),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorites Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
