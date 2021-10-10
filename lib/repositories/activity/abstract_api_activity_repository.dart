import 'package:admin/models/activity/activity.dart';

abstract class AbstractApiActivityRepository {
  Future<Activity> get(String id);
  Future<List<Activity>> getAll();
  Future<void> create(Activity user);
  Future<void> update(Activity user);
  Future<void> delete(String id);
}
