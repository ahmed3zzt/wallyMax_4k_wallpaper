import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wallpaper_app_4k/features/home/controller/home_controller.dart';
import 'package:wallpaper_app_4k/features/home/model/category_model.dart';
import 'package:wallpaper_app_4k/features/home/view/single_category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Categories'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: homeController.categoryPageItemsList.length,
          itemBuilder: (context, index) => Obx(
            () => CategoryItem(
                homeController: homeController,
                categoryModel: homeController.categoryPageItemsList[index]),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.homeController,
    required this.categoryModel,
  });

  final HomeController homeController;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeController.categoryWallpaperList.clear();
        homeController.getWallpaperByCategory(categoryModel.name);
        Get.to(() => SingleCategory(
            categoryModel: categoryModel, homeController: homeController));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              colorFilter:
                  const ColorFilter.mode(Colors.black26, BlendMode.darken),
              image: AssetImage(categoryModel.imageUrl),
              fit: BoxFit.fill,
            )),
        child: Center(
          child: Text(
            categoryModel.name,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
