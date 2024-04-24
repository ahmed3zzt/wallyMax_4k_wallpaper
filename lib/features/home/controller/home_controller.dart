// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:wallpaper_app_4k/features/home/model/wallpaper_model.dart';
import 'package:wallpaper_app_4k/features/home/services/api_services.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxInt page = 1.obs;
  RxList<Wallpaper> wallpaperList = <Wallpaper>[].obs;
  RxBool isLoading = false.obs;

  List<Wallpaper> get getWallpaperList => wallpaperList.value;

  @override
  void onInit() {
    getAllWallpapers();
    super.onInit();
  }

  Future<void> getAllWallpapers() async {
    isLoading.value = true;
    Map<String, dynamic> data =
        await ApiServices().getAllWallpapers(page.value.toString(), '');
    wallpaperList =
        List<Wallpaper>.from(data['results'].map((x) => Wallpaper.fromJson(x)))
            .obs;
    if (wallpaperList.isNotEmpty) {
      isLoading.value = false;
    }
  }
}
