import 'package:admin/models/user/user.dart';
import 'package:admin/repositories/user/repository.dart';
import 'package:admin/utils/http/dio_factory.dart';
import 'package:dio/dio.dart';

class ApiUserRepository implements AbstractApiUserRepository {
  const ApiUserRepository(this._clientFactory);
  final ClientFactory _clientFactory;

  Dio get _dio => _clientFactory.dio;

  static const _route = '/users';

  @override
  Future<User> get(String id) async {
    final res = await _dio.get('$_route/$id');
    return User.fromJson(res.data);
  }

  @override
  Future<List<User>> getAll() async {
    final res = await _dio.get('$_route');
    return (res.data as List<dynamic>).map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<void> create(User user) async {
    await _dio.post('$_route', data: user.toJson());
  }

  @override
  Future<void> delete(String id) async {
    await _dio.post('$_route/$id');
  }

  @override
  Future<void> update(User user) async {
    await _dio.put('$_route/${user.id}', data: user.toJson());
  }
}
