import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:wallpaper_app_4k/features/auth/controller/auth_controller.dart';
import 'package:wallpaper_app_4k/features/home/controller/home_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
