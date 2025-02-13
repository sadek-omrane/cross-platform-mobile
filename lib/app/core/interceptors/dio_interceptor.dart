import 'package:cross_platforme_mobile/app/core/services/secure_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class DioInterceptor extends Interceptor {
  final _secureStorageService = getx.Get.find<SercureStorageService>();
  final Dio dio;

  DioInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await _secureStorageService.getToken();
    options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }
}
