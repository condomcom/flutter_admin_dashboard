import 'dart:async';
import 'dart:developer';

import 'package:admin/redux/app/actions.dart';
import 'package:admin/redux/app/activities/actions.dart';
import 'package:admin/redux/app/app.dart';
import 'package:admin/repositories/activity/repository.dart';
import 'package:redux/redux.dart';

class ActivitiesMiddleware implements MiddlewareClass<AppState> {
  const ActivitiesMiddleware(this.activitiesRepository);

  final AbstractApiActivityRepository activitiesRepository;

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is ActivityAction) {
      _foundActivitiesAction(action, store);
    }
    next(action);
  }

  Future<void> _foundActivitiesAction(
    ActivityAction action,
    Store<AppState> store,
  ) async {
    if (action is LoadActivitiesAction) {
      _loadActivitiess(store);
    } else if (action is CreateActivityAction) {
      _createActivities(action, store);
    }
  }

  Future<void> _createActivities(
    CreateActivityAction action,
    Store<AppState> store,
  ) async {
    try {
      await activitiesRepository.create(action.activity);
      if (store.state.usersState is UsersLoadedAction) {
        store.dispatch(
          ActivitiesLoadedAction(
            (store.state.usersState as ActivitiesLoadedAction).activities
              ..add(action.activity),
          ),
        );
      }
      action.onSuccesed();
    } on Exception catch (e) {
      log('Create activity exception\n$e');
    }
  }

  Future<void> _loadActivitiess(Store<AppState> store) async {
    try {
      final conferences = await activitiesRepository.getAll();
      store.dispatch(ActivitiesLoadedAction(conferences));
    } on Exception catch (_) {
      store.dispatch(ActivitiesLoadingFailureAction());
    }
  }
}
