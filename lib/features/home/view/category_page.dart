import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wallpaper_app_4k/features/home/controller/home_controller.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Categories'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,

                mainAxisSpacing: 10,),
            itemCount: homeController.categoryPageItemsList.length,
            itemBuilder: (context , index) => Obx(
              () => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    colorFilter: const ColorFilter.mode(Colors.black26,BlendMode.darken),
                    image: AssetImage(homeController.categoryPageItemsList[index].imageUrl),
                    fit: BoxFit.fill,
                  )
                ),
                child: Center(
                  child: Text(
                    homeController.categoryPageItemsList[index].name,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ) ,),
      ),
    );
  }
}
