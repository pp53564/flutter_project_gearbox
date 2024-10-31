import 'package:dio/dio.dart';
import 'package:gearbox/auth/data/model/auth_request.dart';
import 'package:gearbox/auth/domain/entity/user.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8080/api/auth')
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/signIn')
  Future<User> signIn(@Body() AuthRequest request);

  @POST('/signUp')
  Future<User> signUp(@Body() AuthRequest request);
}
