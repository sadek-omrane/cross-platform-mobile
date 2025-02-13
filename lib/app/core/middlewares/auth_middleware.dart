import 'package:cross_platforme_mobile/app/core/services/secure_storage_service.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  final _secureStorageService = Get.find<SercureStorageService>();

  @override
  RouteSettings? redirect(String? route) {
    if (!isAuthenticated) {
      return RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }

  bool get isAuthenticated {
    String? token = _secureStorageService.token;
    return token != null && token.isNotEmpty;
  }
}
