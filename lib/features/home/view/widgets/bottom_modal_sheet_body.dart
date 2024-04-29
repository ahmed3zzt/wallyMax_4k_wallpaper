import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wallpaper_app_4k/features/home/controller/home_controller.dart';
import 'package:wallpaper_app_4k/features/home/model/wallpaper_model.dart';

class BottomModalSheetBody extends StatelessWidget {
  const BottomModalSheetBody({
    super.key,
    required this.homeController,
    required this.wallpaper,
  });

  final HomeController homeController;
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Get.back();
            homeController.isWallpaperSet.value = false;
            homeController.setWallpaperHome(wallpaper.urls.regular);
            if (homeController.isWallpaperSet.value) {
              Get.snackbar("ERROR", "Wallpaper Set Failed");
            } else {
              Get.snackbar("SUCCESS", "Wallpaper Set Successfully");
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black38,
                  width: 0.5,
                ),
              ),
            ),
            child: const Center(
              child: Text('Set For Home Screen Wallpaper ',
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Get.back();
            homeController.isWallpaperSet.value = false;
            homeController.setWallpaperLock(wallpaper.urls.regular);
            if (homeController.isWallpaperSet.value) {
              Get.snackbar("ERROR", "Wallpaper Set Failed");
            } else {
              Get.snackbar("SUCCESS", "Wallpaper Set Successfully");
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black38,
                  width: 0.5,
                ),
              ),
            ),
            child: const Center(
              child: Text('Set For Lock Screen Wallpaper ',
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Get.back();
            homeController.isWallpaperSet.value = false;
            homeController.setWallpaper(wallpaper.urls.regular);
            if (homeController.isWallpaperSet.value) {
              Get.snackbar("ERROR", "Wallpaper Set Failed");
            } else {
              Get.snackbar("SUCCESS", "Wallpaper Set Successfully");
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: const BoxDecoration(),
            child: const Center(
              child: Text('Set For Both Screens Wallpaper ',
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
