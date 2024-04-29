// ignore_for_file: invalid_use_of_protected_member

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:glass/glass.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_app_4k/features/home/controller/home_controller.dart';
import 'package:wallpaper_app_4k/features/home/view/widgets/image_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.homeController});
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              UniconsLine.search,
            ),
            onPressed: () {
              homeController.searchWallpaperList.clear();
              homeController.getSearchWallpapers(searchController.text.trim());
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.arrow_left,
          ),
          onPressed: () {
            homeController.searchWallpaperList.clear();
            Get.back();
          },
        ),
        title: SizedBox(
          height: 40,
          child: CupertinoSearchTextField(
            controller: searchController,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            placeholder: 'Find wallpaper...',
            prefixIcon: const Icon(UniconsLine.search),
            suffixIcon: const Icon(
              CupertinoIcons.xmark,
              color: Colors.grey,
            ),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                border: Border.all(
                    color: const Color.fromARGB(255, 41, 41, 41), width: 2),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 41, 41, 41).withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                    spreadRadius: 1,
                  ),
                ]),
          ).asGlass(
            tintColor: const Color.fromARGB(255, 41, 41, 41),
            clipBorderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => homeController.isSearch.value
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    shrinkWrap: false,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 2 / 4,
                    ),
                    itemBuilder: (context, index) => ImageWidget(
                      homeController: homeController,
                      wallpaper:
                          homeController.searchWallpaperList.value[index],
                    ),
                    itemCount: homeController.searchWallpaperList.value.length,
                  ),
          ),
        ),
      ),
    );
  }
}
