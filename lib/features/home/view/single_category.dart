import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_app_4k/features/home/controller/home_controller.dart';
import 'package:wallpaper_app_4k/features/home/model/category_model.dart';

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
                  itemBuilder: (context, index) => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: homeController
                            .categoryWallpaperList.value[index].urls.raw,
                        placeholder: (context, url) => Center(
                          child: Shimmer.fromColors(
                            baseColor: Colors.black38,
                            highlightColor: Colors.black26,
                            enabled: true,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 41, 41, 41)
                                        .withOpacity(0.5),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                    spreadRadius: 1,
                                  ),
                                ],
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount: homeController.categoryWallpaperList.value.length,
                ),
        ),
      ),
    );
  }
}
