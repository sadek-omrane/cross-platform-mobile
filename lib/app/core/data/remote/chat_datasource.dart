import 'dart:io';
import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:cross_platforme_mobile/app/core/network/api_reponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_datasource.g.dart';

@RestApi(baseUrl: API_URL)
abstract class ChatDatasource {
  factory ChatDatasource(Dio dio) = _ChatDatasource;

  //get
  @GET('/chats')
  Future<HttpResponse<ApiResponse>> get();

  //getById
  @GET('/chats/{id}')
  Future<HttpResponse<ApiResponse>> getById({
    @Path('id') required int id,
  });

  //create
  @POST('/chats')
  Future<HttpResponse<ApiResponse>> create({
    @Body() required Map<String, dynamic> body,
  });

  //update
  @PUT('/chats/{id}')
  Future<HttpResponse<ApiResponse>> update({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  //delete
  @DELETE('/chats/{id}')
  Future<HttpResponse<ApiResponse>> delete({
    @Path('id') required int id,
  });
}
