// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wallpaper_app_4k/features/home/controller/home_controller.dart';
import 'package:wallpaper_app_4k/features/home/model/category_model.dart';
import 'package:wallpaper_app_4k/features/home/view/widgets/image_widget.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory(
      {super.key, required this.categoryModel, required this.homeController});

  final CategoryModel categoryModel;
  final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => homeController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  shrinkWrap: false,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2 / 4,
                  ),
                  itemBuilder: (context, index) => ImageWidget(
                    homeController: homeController,
                    wallpaper:
                        homeController.categoryWallpaperList.value[index],
                  ),
                  itemCount: homeController.categoryWallpaperList.value.length,
                ),
        ),
      ),
    );
  }
}
