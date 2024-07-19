import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/core/core.dart';
import '/data/data.dart';

part 'token_client.g.dart';

@RestApi()

/// Token Üreten Servisler
abstract class TokenClient {
  factory TokenClient(Dio dio, {String baseUrl}) = _TokenClient;

  ///
  @POST(AppUrls.register)
  Future<AuthResponse> registerUser(@Body() RegisterRequest request);

  ///
  @POST(AppUrls.login)
  Future<AuthResponse> loginUser(@Body() LoginRequest request);
}
