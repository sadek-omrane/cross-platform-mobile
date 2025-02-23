import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:cross_platforme_mobile/app/core/network/api_reponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_datasource.g.dart';

@RestApi(baseUrl: API_URL)
abstract class UserDataSource {
  //get dio
  factory UserDataSource(Dio dio) = _UserDataSource;

  @GET('/users/me')
  Future<HttpResponse<ApiResponse>> me();

  @POST('/users/login')
  Future<HttpResponse<ApiResponse>> login(@Body() Map<String, dynamic> data);

  @POST('/users/register')
  Future<HttpResponse<ApiResponse>> register(@Body() Map<String, dynamic> data);

  //update
  @PUT('/users/{id}')
  Future<HttpResponse<ApiResponse>> update({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> data,
  });

  //logout
  @POST('/users/logout')
  Future<HttpResponse<ApiResponse>> logout();

  //get
  @GET('/users')
  Future<HttpResponse<ApiResponse>> get({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('search') String? search,
  });
}
