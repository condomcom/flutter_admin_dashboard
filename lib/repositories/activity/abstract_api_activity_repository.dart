import 'package:admin/models/activity/activity.dart';

abstract class AbstractApiActivityRepository {
  Future<Activity> get(String id);
  Future<List<Activity>> getAll();
  Future<void> create(Activity activity);
  Future<void> update(Activity activity);
  Future<void> delete(String id);
}
