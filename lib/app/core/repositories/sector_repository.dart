import 'package:cross_platforme_mobile/app/core/data/remote/sector_datasource.dart';
import 'package:cross_platforme_mobile/app/core/models/sector_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

class SectorRepository {
  final _SectorDataSource = Get.find<SectorDataSource>();

  Future<Either<String, List<SectorModel>>> get() async {
    try {
      final response = await _SectorDataSource.get();
      if (response.data.success == true) {
        return Right((response.data.data as List)
            .map((e) => SectorModel.fromJson(e))
            .toList());
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, SectorModel>> getById(int id) async {
    try {
      final response = await _SectorDataSource.getById(id: id);
      if (response.data.success == true) {
        return Right(SectorModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, SectorModel>> create(Map<String, dynamic> data) async {
    try {
      final response = await _SectorDataSource.create(body: data);
      if (response.data.success == true) {
        return Right(SectorModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, SectorModel>> update(
      int id, Map<String, dynamic> data) async {
    try {
      final response = await _SectorDataSource.update(id: id, body: data);
      if (response.data.success == true) {
        return Right(SectorModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, String?>> delete(int id) async {
    try {
      final response = await _SectorDataSource.delete(id: id);
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
