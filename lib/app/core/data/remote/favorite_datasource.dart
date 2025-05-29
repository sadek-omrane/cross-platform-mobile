import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:cross_platforme_mobile/app/core/network/api_reponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'favorite_datasource.g.dart';

@RestApi(baseUrl: API_URL)
abstract class FavoriteDataSource {
  factory FavoriteDataSource(Dio dio) = _FavoriteDataSource;

  //get
  @GET('/favorites')
  Future<HttpResponse<ApiResponse>> get({
    @Query('search') String? search,
  });

  //create
  @POST('/favorites')
  Future<HttpResponse<ApiResponse>> create({
    @Body() required Map<String, dynamic> body,
  });

  //delete
  @DELETE('/favorites/{id}')
  Future<HttpResponse<ApiResponse>> delete({
    @Path('id') required int id,
  });
}
