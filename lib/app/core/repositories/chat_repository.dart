import 'package:cross_platforme_mobile/app/core/data/remote/chat_datasource.dart';
import 'package:cross_platforme_mobile/app/core/models/chat_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

class ChatRepository {
  final _chatDataSource = Get.find<ChatDatasource>();

  Future<Either<String, List<ChatModel>>> get() async {
    try {
      final response = await _chatDataSource.get();
      if (response.data.success == true) {
        return Right((response.data.data as List)
            .map((e) => ChatModel.fromJson(e))
            .toList());
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, ChatModel>> getById(int id) async {
    try {
      final response = await _chatDataSource.getById(id: id);
      if (response.data.success == true) {
        return Right(ChatModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, ChatModel>> create(Map<String, dynamic> data) async {
    try {
      final response = await _chatDataSource.create(body: data);
      if (response.data.success == true) {
        return Right(ChatModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, ChatModel>> update(
      int id, Map<String, dynamic> data) async {
    try {
      final response = await _chatDataSource.update(id: id, body: data);
      if (response.data.success == true) {
        return Right(ChatModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, String?>> delete(int id) async {
    try {
      final response = await _chatDataSource.delete(id: id);
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
