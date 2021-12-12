import 'package:admin/models/activity/activity.dart';

class ActivitiesState {}

class ActivitiesLoadingFailure extends ActivitiesState {}

class ActivitiesLoaded extends ActivitiesState {
  ActivitiesLoaded(this.activities);
  final List<Activity> activities;
}
