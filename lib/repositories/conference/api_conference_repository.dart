import 'package:admin/models/conference/conference.dart';
import 'package:admin/repositories/conference/repository.dart';
import 'package:admin/utils/formaters/formaters.dart';
import 'package:admin/utils/http/dio_factory.dart';
import 'package:dio/dio.dart';

class ApiConferenceRepository implements AbstractApiConferenceRepository {
  const ApiConferenceRepository(this._clientFactory);
  final ClientFactory _clientFactory;

  Dio get _dio => _clientFactory.dio;

  static const _route = '/conferences';

  @override
  Future<Conference> get(String id) async {
    final res = await _dio.get('$_route/$id');
    return Conference.fromJson(res.data);
  }

  @override
  Future<List<Conference>> getAll() async {
    final res = await _dio.get('$_route');
    return (res.data as List<dynamic>)
        .map((e) => Conference.fromJson(e))
        .toList();
  }

  @override
  Future<void> create(Conference user) async {
    await _dio.post(
      '$_route',
      data: HttpRequestFormater(user.toJson()).clean().data,
    );
  }

  @override
  Future<void> delete(String id) async {
    await _dio.delete('$_route/$id');
  }

  @override
  Future<void> update(Conference user) async {
    await _dio.put(
      '$_route/${user.id}',
      data: HttpRequestFormater(user.toJson()).clean().data,
    );
  }
}
