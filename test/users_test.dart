import 'package:admin/repositories/user/repository.dart';
import 'package:admin/utils/http/dio_factory.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final _cF = ClientFactory(
    baseUrl: 'http://localhost:5000',
    apiKey: '',
    apiPath: '/api',
  );
  final usersRepo = ApiUserRepository(_cF);

  test(
    'Get users test',
    () async {
      final users = await usersRepo.getAll();
      expect(users, isNotEmpty);
    },
  );

  test(
    'Get user test',
    () async {
      final users = await usersRepo.getAll();
      final user = await usersRepo.get(users.first.id);
      expect(user, isNotNull);
    },
  );

  test(
    'Create user test',
    () async {
      final users = await usersRepo.getAll();
      await usersRepo.create(users.first);
      expect([], isEmpty);
    },
  );

  test(
    'Update user test',
    () async {
      final users = await usersRepo.getAll();
      await usersRepo.update(users.first);
      expect([], isEmpty);
    },
  );

  test(
    'Delete user test',
    () async {
      final users = await usersRepo.getAll();
      await usersRepo.delete(users.first.id);
      expect([], isEmpty);
    },
  );
}
