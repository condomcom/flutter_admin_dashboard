import 'package:admin/models/user/user.dart';

abstract class AbstractApiUserRepository {
  Future<User> get(String id);
  Future<List<User>> getAll();
  Future<void> create(User user);
  Future<void> update(User user);
  Future<void> delete(String id);
}
