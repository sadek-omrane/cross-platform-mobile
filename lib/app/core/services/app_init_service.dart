import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:cross_platforme_mobile/app/core/interceptors/dio_interceptor.dart';
import 'package:cross_platforme_mobile/app/core/services/secure_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AppInitService {
  static init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    Get.put(FlutterSecureStorage(), permanent: true);
    await Get.putAsync(() => SercureStorageService().init(), permanent: true);
    final options = BaseOptions(
      baseUrl: API_URL,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(minutes: 1),
      validateStatus: (status) => status != null && status < 500,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    final _dio = Dio(options);
    _dio.interceptors.add(DioInterceptor(_dio));
    Get.put(_dio, permanent: true);
  }
}
