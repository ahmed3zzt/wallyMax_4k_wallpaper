

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/home_controller.dart';

class NewestWallpapersList extends StatelessWidget {
  const NewestWallpapersList({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Obx(
            () => homeController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2/4,
          ),
          itemBuilder: (context, index) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: homeController.wallpaperList.value[index].urls.raw,
                placeholder: (context, url) =>  Center(
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
                  ) ,

                ),),
            ),),
          itemCount: homeController.wallpaperList.value.length,
        ),
      ),
    );
  }
}
