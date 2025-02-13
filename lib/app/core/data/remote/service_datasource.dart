import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:cross_platforme_mobile/app/core/network/api_reponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'service_datasource.g.dart';

@RestApi(baseUrl: API_URL)
abstract class ServiceDatasource {
  factory ServiceDatasource(Dio dio) = _ServiceDatasource;

  //get
  @GET('/services')
  Future<HttpResponse<ApiResponse>> get();

  //getById
  @GET('/services/{id}')
  Future<HttpResponse<ApiResponse>> getById({
    @Path('id') required int id,
  });

  //create
  @POST('/services')
  Future<HttpResponse<ApiResponse>> create({
    @Body() required Map<String, dynamic> body,
  });

  //update
  @PUT('/services/{id}')
  Future<HttpResponse<ApiResponse>> update({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  //delete
  @DELETE('/services/{id}')
  Future<HttpResponse<ApiResponse>> delete({
    @Path('id') required int id,
  });
}
