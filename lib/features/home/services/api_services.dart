import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.unsplash.com/search/photos',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getAllWallpapers(
      String page, String query) async {
    try {
      Response response = await dio.get(
          '?query=%22Wallpaper%22&orientation=portrait&per_page=10&page=$page&client_id=MbMI0C4cFoCsjZSDn6KlTBhe7JgaNN0X1QM61htraOg');
      return response.data;
    } on DioException catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
