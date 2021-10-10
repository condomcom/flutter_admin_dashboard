import 'package:admin/models/conference/conference.dart';

abstract class AbstractApiConferenceRepository {
  Future<Conference> get(String id);
  Future<List<Conference>> getAll();
  Future<void> create(Conference user);
  Future<void> update(Conference user);
  Future<void> delete(String id);
}
