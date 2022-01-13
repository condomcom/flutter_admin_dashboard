import 'package:admin/models/activity/activity.dart';
import 'package:admin/redux/app/actions.dart';

class LoadActivitiesAction extends ActivityAction {}

class CreateActivityAction extends ActivityAction {
  CreateActivityAction(this.activity, {required this.onSuccesed});
  final Activity activity;
  final Function() onSuccesed;
}

class UpdateActivityAction extends ActivityAction {
  UpdateActivityAction(this.activity, {required this.onSuccesed});
  final Activity activity;
  final Function() onSuccesed;
}

class DeleteActivityAction extends ActivityAction {
  DeleteActivityAction(this.activityId, {required this.onSuccesed});
  final String activityId;
  final Function() onSuccesed;
}

class ActivitiesLoadedAction extends ActivityAction {
  ActivitiesLoadedAction(this.activities);
  final List<Activity> activities;
}

class ActivitiesLoadingFailureAction extends ActivityAction {}
