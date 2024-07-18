import 'package:injectable/injectable.dart';

import '/data/data.dart';

abstract class IAuthRepository {
  Future<AuthResponse> logoutUser({required LogoutRequest request});
  Future<AuthResponse> removeUser({required int id});
  Future<User> updateUser({required UserRequest request, required int id});
  Future<User> getUserById({required int id});
  Future<Users> getAllUsers();
  Future<Todos> getAllTodos();
  Future<Todo> getTodoById({required int id});
  Future<Todo> updateTodo({required TodoRequest request, required int id});
  Future<Todo> deleteTodo({required int id});
  Future<Todo> insertTodo({required TodoRequest request});
}

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  ///
  AuthRepository({required this.authClient});

  ///
  final AuthClient authClient;

  ///
  @override
  Future<Todo> deleteTodo({required int id}) => authClient.deleteTodo(id);

  ///
  @override
  Future<Todos> getAllTodos() => authClient.getAllTodos();

  ///
  @override
  Future<Users> getAllUsers() => authClient.getAllUsers();

  ///
  @override
  Future<Todo> getTodoById({required int id}) => authClient.getTodoById(id);

  ///
  @override
  Future<User> getUserById({required int id}) => authClient.getUserById(id);

  @override
  Future<Todo> insertTodo({required TodoRequest request}) =>
      authClient.insertTodo(request);

  ///
  @override
  Future<AuthResponse> logoutUser({required LogoutRequest request}) =>
      authClient.logoutUser(request);

  ///
  @override
  Future<AuthResponse> removeUser({required int id}) =>
      authClient.removeUser(id);

  ///
  @override
  Future<Todo> updateTodo({required TodoRequest request, required int id}) =>
      authClient.updateTodo(request, id);

  ///
  @override
  Future<User> updateUser({required UserRequest request, required int id}) =>
      authClient.updateUser(request, id);
}
