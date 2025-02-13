import 'package:cross_platforme_mobile/app/core/data/remote/message_datasource.dart';
import 'package:cross_platforme_mobile/app/core/models/chat_model.dart';
import 'package:cross_platforme_mobile/app/core/models/message_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

class MessageRepository {
  final _messageDataSource = Get.find<MessageDatasource>();

  Future<Either<String, MessageModel>> create(Map<String, dynamic> data) async {
    try {
      final response = await _messageDataSource.create(body: data);
      if (response.data.success == true) {
        return Right(MessageModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, MessageModel>> update(
      int id, Map<String, dynamic> data) async {
    try {
      final response = await _messageDataSource.update(id: id, body: data);
      if (response.data.success == true) {
        return Right(MessageModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, String>> delete(int id) async {
    try {
      final response = await _messageDataSource.delete(id: id);
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
