import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '/core/core.dart';
import '/data/data.dart';

part 'auth_client.g.dart';

@RestApi()

/// Token İsteyen Sınıflar
abstract class AuthClient {
  ///
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  /// [ USERS'a Ait Olanlar] ////
  ///
  @POST(AppUrls.logout)
  Future<AuthResponse> logoutUser(@Body() LogoutRequest request);

  ///
  @DELETE('${AppUrls.users}/{id}')
  Future<AuthResponse> removeUser(@Path('id') int id);

  ///
  @PUT('${AppUrls.users}/{id}')
  Future<User> updateUser(@Body() UserRequest request, @Path('id') int id);

  ///
  @GET('${AppUrls.users}/{id}')
  Future<User> getUserById(@Path('id') int id);

  ///
  @GET(AppUrls.users)
  Future<Users> getAllUsers();

  /// [ TODOS'a Ait Olanlar] ////
  @GET(AppUrls.todos)
  Future<Todos> getAllTodos();

  @GET('${AppUrls.todos}/{id}')
  Future<Todo> getTodoById(@Path('id') int id);

  @PUT('${AppUrls.todos}/{id}')
  Future<Todo> updateTodo(@Body() TodoRequest request, @Path('id') int id);

  @DELETE('${AppUrls.todos}/{id}')
  Future<Todo> deleteTodo(@Path('id') int id);

  @POST(AppUrls.todos)
  Future<Todo> insertTodo(@Body() TodoRequest request);
}
