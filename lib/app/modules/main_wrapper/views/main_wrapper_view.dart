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
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.accent6,
      currentIndex: currentIndex,
      onTap: (value) {
        if (value != 4) delegate.toNamed(controller.routes[value]);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Bootstrap.house),
          activeIcon: Icon(Bootstrap.house_fill),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Bootstrap.search_heart),
          activeIcon: Icon(Bootstrap.search_heart_fill),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Bootstrap.chat),
          activeIcon: Icon(Bootstrap.chat_fill),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Bootstrap.person),
          activeIcon: Icon(Bootstrap.person_fill),
          label: 'Profile',
        ),
      ],
    );
  }
}
