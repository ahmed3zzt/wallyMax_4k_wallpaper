import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:social_share/social_share.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_app_4k/features/home/model/wallpaper_model.dart';
import 'package:wallpaper_app_4k/features/home/view/widgets/bottom_modal_sheet_body.dart';

import '../controller/home_controller.dart';

class SingleImage extends StatelessWidget {
  const SingleImage(
      {super.key, required this.wallpaper, required this.homeController});
  final Wallpaper wallpaper;
  final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(wallpaper.urls.regular),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08,
                    vertical: MediaQuery.of(context).size.height * 0.1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(wallpaper.urls.regular),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            shape: const CircleBorder(),
                            backgroundColor: Colors.black38,
                            mini: true,
                            child: const Icon(UniconsLine.heart),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              showBarModalBottomSheet(
                                context: context,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                expand: false,
                                builder: (context) => SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.31,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BottomModalSheetBody(
                                        homeController: homeController,
                                        wallpaper: wallpaper),
                                  ),
                                ),
                              );
                            },
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            child: const Icon(
                              UniconsLine.image_download,
                              size: 32,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                      text: wallpaper.urls.regular))
                                  .then((_) {
                                Get.snackbar(
                                  'Success',
                                  'Wallpaper Url Copied',
                                );
                              });
                            },
                            shape: const CircleBorder(),
                            backgroundColor: Colors.black38,
                            mini: true,
                            child: const Icon(UniconsLine.share),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
