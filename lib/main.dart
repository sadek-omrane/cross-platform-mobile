import 'package:cross_platforme_mobile/app/core/services/app_init_service.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await AppInitService.init();
  runApp(
    ToastificationWrapper(
      child: GetMaterialApp(
        title: "LocalPro",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: appTheme,
      ),
    ),
  );
}
