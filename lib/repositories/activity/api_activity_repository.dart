import 'package:admin/models/activity/activity.dart';
import 'package:admin/repositories/activity/repository.dart';
import 'package:admin/utils/formaters/formaters.dart';
import 'package:admin/utils/http/dio_factory.dart';
import 'package:dio/dio.dart';

class ApiActivityRepository implements AbstractApiActivityRepository {
  const ApiActivityRepository(this._clientFactory);
  final ClientFactory _clientFactory;

  Dio get _dio => _clientFactory.dio;

  static const _route = '/activities';

  @override
  Future<Activity> get(String id) async {
    final res = await _dio.get('$_route/$id');
    return Activity.fromJson(res.data);
  }

  @override
  Future<List<Activity>> getAll() async {
    final res = await _dio.get('$_route');
    return (res.data as List<dynamic>)
        .map((e) => Activity.fromJson(e))
        .toList();
  }

  @override
  Future<void> create(Activity user) async {
    await _dio.post(
      '$_route',
      data: HttpRequestFormater(user.toJson()).clean(),
    );
  }

  @override
  Future<void> delete(String id) async {
    await _dio.delete('$_route/$id');
  }

  @override
  Future<void> update(Activity user) async {
    await _dio.put(
      '$_route/${user.id}',
      data: HttpRequestFormater(user.toJson()).clean(),
    );
  }
}
