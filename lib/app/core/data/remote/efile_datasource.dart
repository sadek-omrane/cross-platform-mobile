import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:cross_platforme_mobile/app/core/network/api_reponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'efile_datasource.g.dart';

@RestApi(baseUrl: API_URL)
abstract class EFileDataSource {
  factory EFileDataSource(Dio dio) = _EFileDataSource;

  //upload
  @POST('/efiles/upload')
  Future<HttpResponse<ApiResponse>> upload(
      @Part(name: 'file', contentType: 'image/png') File file);

  //delete
  @DELETE('/efiles/{id}')
  Future<HttpResponse<ApiResponse>> delete({
    @Path('id') required int id,
  });
}
