import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:cross_platforme_mobile/app/core/network/api_reponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'message_datasource.g.dart';

@RestApi(baseUrl: API_URL)
abstract class MessageDatasource {
  factory MessageDatasource(Dio dio) = _MessageDatasource;

  //get
  @GET('/messages')
  Future<HttpResponse<ApiResponse>> get();

  //getById
  @GET('/messages/{id}')
  Future<HttpResponse<ApiResponse>> getById({
    @Path('id') required int id,
  });

  //create
  @POST('/messages')
  Future<HttpResponse<ApiResponse>> create({
    @Body() required Map<String, dynamic> body,
  });

  //update
  @PUT('/messages/{id}')
  Future<HttpResponse<ApiResponse>> update({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  //delete
  @DELETE('/messages/{id}')
  Future<HttpResponse<ApiResponse>> delete({
    @Path('id') required int id,
  });
}
