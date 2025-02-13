import 'dart:io';
import 'package:cross_platforme_mobile/app/core/data/remote/efile_datasource.dart';
import 'package:cross_platforme_mobile/app/core/models/efile_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

class EFileRepository {
  final _eFileDataSource = Get.find<EFileDataSource>();

  Future<Either<String, EfileModel>> upload(File file) async {
    try {
      final response = await _eFileDataSource.upload(file);
      if (response.data.success == true) {
        return Right(EfileModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }
}
