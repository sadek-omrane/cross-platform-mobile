import 'package:flutter/material.dart';
import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/main_wrapper_controller.dart';

class MainWrapperView extends GetView<MainWrapperController> {
  const MainWrapperView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: Get.rootDelegate,
      builder: (context, delegate, currentRoute) {
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute:
                currentRoute?.locationString ?? controller.initialRoute,
          ),
          bottomNavigationBar: buttomNavigationBar(
            delegate,
            controller.currentIndex(currentRoute?.locationString),
          ),
        );
      },
    );
  }

  Widget buttomNavigationBar(GetDelegate delegate, int currentIndex) {
    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.accent2,
              width: .5,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(
                    currentIndex == 0 ? Bootstrap.house_fill : Bootstrap.house),
                onPressed: () {
                  if (currentIndex != 0) delegate.toNamed(controller.routes[0]);
                },
                color: currentIndex == 0 ? AppColors.blue : AppColors.accent6,
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(currentIndex == 1
                    ? Bootstrap.search_heart_fill
                    : Bootstrap.search_heart),
                onPressed: () {
                  if (currentIndex != 1) delegate.toNamed(controller.routes[1]);
                },
                color: currentIndex == 1 ? AppColors.blue : AppColors.accent6,
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                    currentIndex == 2 ? Bootstrap.chat_fill : Bootstrap.chat),
                onPressed: () {
                  if (currentIndex != 2) delegate.toNamed(controller.routes[2]);
                },
                color: currentIndex == 2 ? AppColors.blue : AppColors.accent6,
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(currentIndex == 3
                    ? Bootstrap.person_fill
                    : Bootstrap.person),
                onPressed: () {
                  if (currentIndex != 3) delegate.toNamed(controller.routes[3]);
                },
                color: currentIndex == 3 ? AppColors.blue : AppColors.accent6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
