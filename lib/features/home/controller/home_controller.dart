// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:wallpaper_app_4k/features/home/model/category_model.dart';
import 'package:wallpaper_app_4k/features/home/model/wallpaper_model.dart';
import 'package:wallpaper_app_4k/features/home/services/api_services.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxInt page = 1.obs;
  RxList<Wallpaper> wallpaperList = <Wallpaper>[].obs;
  RxBool isLoading = false.obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  List<Wallpaper> get getWallpaperList => wallpaperList.value;

  @override
  void onInit() {
    getAllWallpapers();
    getAllCategories();
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

  void getAllCategories() {
    categoryList.value = [
      CategoryModel(name: 'Abstract', imageUrl: "assets/images/abstract.png"),
      CategoryModel(name: 'Art', imageUrl: "assets/images/art.png"),
      CategoryModel(name: 'Beach', imageUrl: "assets/images/beach.png"),
      // CategoryModel(name: 'Bikes', imageUrl: "assets/images/Bikes.png"),
      CategoryModel(name: 'Cars', imageUrl: "assets/images/cars.png"),
      // CategoryModel(name: 'Food', imageUrl: "assets/images/food.png"),
      // CategoryModel(name: 'Games', imageUrl: "assets/images/games.png"),
      // CategoryModel(name: 'Girls', imageUrl: "assets/images/girls.png"),
      // CategoryModel(
      //     name: 'Motorbikes', imageUrl: "assets/images/motorbikes.png"),
      // CategoryModel(name: 'Music', imageUrl: "assets/images/music.png"),
      // CategoryModel(name: 'Nature', imageUrl: "assets/images/nature.png"),
      // CategoryModel(name: 'Rain', imageUrl: "assets/images/rain.png"),
      // CategoryModel(name: 'Sea', imageUrl: "assets/images/sea.png"),
      // CategoryModel(name: 'Sky', imageUrl: "assets/images/sky.png"),
      // CategoryModel(name: 'Space', imageUrl: "assets/images/space.png"),
      // CategoryModel(name: 'Sunset', imageUrl: "assets/images/sunset.png"),
    ];
  }
}
