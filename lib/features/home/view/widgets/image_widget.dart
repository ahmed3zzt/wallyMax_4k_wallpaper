import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_app_4k/features/home/controller/home_controller.dart';
import 'package:wallpaper_app_4k/features/home/model/wallpaper_model.dart';
import 'package:wallpaper_app_4k/features/home/view/single_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.homeController,
    required this.wallpaper,
  });

  final HomeController homeController;
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            () => SingleImage(
                  wallpaper: wallpaper,
                  homeController: homeController,
                ),
            transition: Transition.rightToLeft);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: wallpaper.urls.regular,
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
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
