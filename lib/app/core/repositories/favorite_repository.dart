import 'package:cross_platforme_mobile/app/core/data/remote/favorite_datasource.dart';
import 'package:cross_platforme_mobile/app/core/models/service_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

class FavoriteRepository {
  final _favoriteDataSource = Get.find<FavoriteDataSource>();

  Future<Either<String, List<ServiceModel>>> get({
    String? search,
  }) async {
    try {
      final response = await _favoriteDataSource.get(
        search: search,
      );
      if (response.data.success == true) {
        return Right((response.data.data as List)
            .map((e) => ServiceModel.fromJson(e))
            .toList());
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, ServiceModel>> create(Map<String, dynamic> data) async {
    try {
      final response = await _favoriteDataSource.create(body: data);
      if (response.data.success == true) {
        return Right(ServiceModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, String?>> delete(int id) async {
    try {
      final response = await _favoriteDataSource.delete(id: id);
      if (response.data.success == true) {
        return Right(response.data.data);
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }
}
