import 'dart:io';

import 'package:cross_platforme_mobile/app/core/data/remote/user_datasource.dart';
import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  final _userDataSource = Get.find<UserDataSource>();

  Future<Either<String, UserModel>> me() async {
    try {
      final response = await _userDataSource.me();
      if (response.data.success == true) {
        return Right(UserModel.fromJson(response.data.data));
      } else {
        print('data: ${response.data}');
        return Left("Error");
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, String>> login(Map<String, String> data) async {
    try {
      final response = await _userDataSource.login(data);
      if (response.data.success == true) {
        return Right(response.data.data);
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  Future<Either<String, String>> register(Map<String, String> data) async {
    try {
      final response = await _userDataSource.register(data);
      if (response.data.success == true) {
        return Right(response.data.data);
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  //update
  Future<Either<String, UserModel>> update(
      int id, Map<String, dynamic> data) async {
    try {
      final response = await _userDataSource.update(id: id, data: data);
      if (response.data.success == true) {
        return Right(UserModel.fromJson(response.data.data));
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  //logout
  Future<Either<String, String?>> logout() async {
    try {
      final httpResponse = await _userDataSource.logout();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data.data);
      } else {
        return Left(httpResponse.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }

  //get
  Future<Either<String, List<UserModel>>> get({String? search}) async {
    try {
      final response = await _userDataSource.get(search: search);
      if (response.data.success == true) {
        final users = response.data.data as List;
        final List<UserModel> usersList =
            users.map((e) => UserModel.fromJson(e)).toList();
        return Right(usersList);
      } else {
        return Left(response.data.message);
      }
    } on DioException catch (e) {
      return Left("${e.message}");
    }
  }
}
