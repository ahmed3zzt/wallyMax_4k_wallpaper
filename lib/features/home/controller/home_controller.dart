// ignore_for_file: invalid_use_of_protected_member

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper_app_4k/features/home/model/category_model.dart';
import 'package:wallpaper_app_4k/features/home/model/wallpaper_model.dart';
import 'package:wallpaper_app_4k/features/home/services/api_services.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxInt page = 1.obs;
  RxList<Wallpaper> wallpaperList = <Wallpaper>[].obs;
  RxBool isLoading = false.obs;
  RxList<CategoryModel> categoryHomeList = <CategoryModel>[].obs;
  List<Wallpaper> get getWallpaperList => wallpaperList.value;
  RxList<CategoryModel> categoryPageItemsList = <CategoryModel>[].obs;
  RxList<Wallpaper> categoryWallpaperList = <Wallpaper>[].obs;
  RxList<Wallpaper> searchWallpaperList = <Wallpaper>[].obs;
  RxBool isWallpaperSet = false.obs;
  RxBool isSearch = false.obs;
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
    categoryHomeList.value = [
      CategoryModel(name: 'Abstract', imageUrl: "assets/images/abstract.png"),
      CategoryModel(name: 'Art', imageUrl: "assets/images/art.png"),
      CategoryModel(name: 'Beach', imageUrl: "assets/images/beach.png"),
      CategoryModel(name: 'Cars', imageUrl: "assets/images/cars.png"),
    ];
    categoryPageItemsList.value = [
      CategoryModel(name: 'Abstract', imageUrl: "assets/images/abstract.png"),
      CategoryModel(name: 'Art', imageUrl: "assets/images/art.png"),
      CategoryModel(name: 'Beach', imageUrl: "assets/images/beach.png"),
      CategoryModel(name: 'Bikes', imageUrl: "assets/images/bikes.png"),
      CategoryModel(name: 'Cars', imageUrl: "assets/images/cars.png"),
      CategoryModel(name: 'Food', imageUrl: "assets/images/food.png"),
      CategoryModel(name: 'Games', imageUrl: "assets/images/games.png"),
      CategoryModel(name: 'Girls', imageUrl: "assets/images/girls.png"),
      CategoryModel(
          name: 'Motorbikes', imageUrl: "assets/images/motorbikes.png"),
      CategoryModel(name: 'Music', imageUrl: "assets/images/music.png"),
      CategoryModel(name: 'Nature', imageUrl: "assets/images/nature.png"),
      CategoryModel(name: 'Rain', imageUrl: "assets/images/rain.png"),
      CategoryModel(name: 'Sea', imageUrl: "assets/images/sea.png"),
      CategoryModel(name: 'Sky', imageUrl: "assets/images/sky.png"),
      CategoryModel(name: 'Space', imageUrl: "assets/images/space.png"),
      CategoryModel(name: 'Sunset', imageUrl: "assets/images/sunset.png"),
    ];
  }

  Future<void> getSearchWallpapers(String query) async {
    isSearch.value = true;
    Map<String, dynamic> data = await ApiServices().getSearchWallpapers(query);

    searchWallpaperList =
        List<Wallpaper>.from(data['results'].map((x) => Wallpaper.fromJson(x)))
            .obs;
    if (searchWallpaperList.isNotEmpty) {
      isSearch.value = false;
    }
  }

  Future<void> getWallpaperByCategory(String category) async {
    isLoading.value = true;
    Map<String, dynamic> data =
        await ApiServices().getCategoryWallpapers(category);

    categoryWallpaperList =
        List<Wallpaper>.from(data['results'].map((x) => Wallpaper.fromJson(x)))
            .obs;

    if (categoryWallpaperList.isNotEmpty) {
      isLoading.value = false;
    }
  }

  Future<void> setWallpaper(String url) async {
    try {
      String imgUrl = url;
      int location = WallpaperManager.BOTH_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(imgUrl);
      isWallpaperSet.value =
          await WallpaperManager.setWallpaperFromFile(file.path, location);

      debugPrint(isWallpaperSet.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> setWallpaperHome(String url) async {
    try {
      String imgUrl = url;
      int location = WallpaperManager.HOME_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(imgUrl);
      isWallpaperSet.value =
          await WallpaperManager.setWallpaperFromFile(file.path, location);

      debugPrint(isWallpaperSet.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> setWallpaperLock(String url) async {
    try {
      String imgUrl = url;
      int location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(imgUrl);
      isWallpaperSet.value =
          await WallpaperManager.setWallpaperFromFile(file.path, location);

      debugPrint(isWallpaperSet.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> launchUrlFn(String url) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }
}
