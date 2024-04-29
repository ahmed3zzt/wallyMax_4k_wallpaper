// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wallpaper_app_4k/features/home/view/widgets/image_widget.dart';

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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2 / 4,
                ),
                itemBuilder: (context, index) => ImageWidget(
                    homeController: homeController,
                    wallpaper: homeController.wallpaperList.value[index]),
                itemCount: homeController.wallpaperList.value.length,
              ),
      ),
    );
  }
}
