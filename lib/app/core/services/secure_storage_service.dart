import 'dart:convert';
import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SercureStorageService {
  final _secureStorage = Get.find<FlutterSecureStorage>();
  final _user = Rx<UserModel?>(null);
  UserModel? get user => _user.value;
  set user(UserModel? value) => _user.value = value;
  final _token = Rx<String?>(null);
  String? get token => _token.value;
  set token(String? value) => _token.value = value;

  Future<SercureStorageService> init() async {
    final user = await getUser();
    final token = await getToken();
    if (user != null && token != null) {
      this.user = user;
      this.token = token;
    }
    return this;
  }

  Future<UserModel?> getUser() async {
    final response = await _secureStorage.read(key: 'user');
    final jsonUser = response != null ? jsonDecode(response) : null;
    return jsonUser != null ? UserModel.fromJson(jsonUser) : null;
  }

  Future<void> setUser(UserModel user) async {
    this._user.value = user;
    this._user.refresh();
    await _secureStorage.write(key: 'user', value: jsonEncode(user.toJson()));
  }

  Future<void> removeUser() async {
    this._user.value = null;
    await _secureStorage.delete(key: 'user');
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }

  Future<void> setToken(String token) async {
    this._token.value = token;
    this._token.refresh();
    await _secureStorage.write(key: 'token', value: token);
  }

  Future<void> removeToken() async {
    await _secureStorage.delete(key: 'token');
    this._token.value = null;
    this._token.refresh();
  }
}
