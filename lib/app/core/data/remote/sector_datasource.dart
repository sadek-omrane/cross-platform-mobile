import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:cross_platforme_mobile/app/core/network/api_reponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sector_datasource.g.dart';

@RestApi(baseUrl: API_URL)
abstract class SectorDataSource {
  factory SectorDataSource(Dio dio) = _SectorDataSource;

  //get
  @GET('/sectors')
  Future<HttpResponse<ApiResponse>> get();

  //getById
  @GET('/sectors/{id}')
  Future<HttpResponse<ApiResponse>> getById({
    @Path('id') required int id,
  });

  //create
  @POST('/sectors')
  Future<HttpResponse<ApiResponse>> create({
    @Body() required Map<String, dynamic> body,
  });

  //update
  @PUT('/sectors/{id}')
  Future<HttpResponse<ApiResponse>> update({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  //delete
  @DELETE('/sectors/{id}')
  Future<HttpResponse<ApiResponse>> delete({
    @Path('id') required int id,
  });
}
