// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:quickalert/quickalert.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_app_4k/features/home/controller/home_controller.dart';
import 'package:wallpaper_app_4k/features/home/view/search_page.dart';
import 'package:wallpaper_app_4k/features/home/view/single_category.dart';
import 'package:wallpaper_app_4k/features/home/view/widgets/carouserl_slider.dart';
import 'package:wallpaper_app_4k/features/home/view/widgets/newest_wallpapers_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController.instance;
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 48,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.78,
                      child: CupertinoSearchTextField(
                        placeholder: 'Find wallpaper...',
                        prefixIcon: const Icon(UniconsLine.search),
                        suffixIcon: const Icon(
                          CupertinoIcons.xmark,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => SearchScreen(
                              homeController: homeController,
                            ),
                          );
                        },
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            border: Border.all(
                                color: const Color.fromARGB(255, 41, 41, 41),
                                width: 2),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: const Color.fromARGB(255, 41, 41, 41)
                                    .withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                                spreadRadius: 1,
                              ),
                            ]),
                      ).asGlass(
                        tintColor: const Color.fromARGB(255, 41, 41, 41),
                        clipBorderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.bell,
                        size: 26,
                      ),
                      onPressed: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.info,
                          text: 'This feature will be available soon',
                          title: 'Coming Soon',
                          backgroundColor:
                              const Color.fromARGB(255, 41, 41, 41),
                          confirmBtnColor: Colors.deepPurple,
                          textColor: Colors.white,
                          titleColor: Colors.white,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
            const MainCarouselSlider(),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
            const SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
            SliverToBoxAdapter(
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: homeController.categoryHomeList.value
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            homeController.categoryWallpaperList.clear();
                            homeController.getWallpaperByCategory(e.name);
                            Get.to(() => SingleCategory(
                                categoryModel: e,
                                homeController: homeController));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.02),
                            width: MediaQuery.of(context).size.width * 0.20,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.darken,
                                ),
                                image: AssetImage(e.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                                child: Text(
                              e.name,
                              style: const TextStyle(fontSize: 16),
                            )),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
            const SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    'Newest Wallpaper',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            NewestWallpapersList(homeController: homeController),
          ],
        ),
      ),
    );
  }
}
