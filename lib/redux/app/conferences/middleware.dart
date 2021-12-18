import 'dart:async';
import 'dart:developer';

import 'package:admin/redux/app/actions.dart';
import 'package:admin/redux/app/activities/actions.dart';
import 'package:admin/redux/app/app.dart';
import 'package:admin/redux/app/conferences/conferences.dart';
import 'package:admin/repositories/conference/repository.dart';
import 'package:redux/redux.dart';

class ConferenceMiddleware implements MiddlewareClass<AppState> {
  const ConferenceMiddleware(this.conferenceRepository);

  final AbstractApiConferenceRepository conferenceRepository;

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is ConferencesAction) {
      _foundConferenceAction(action, store);
    }
    next(action);
  }

  Future<void> _foundConferenceAction(
    ConferencesAction action,
    Store<AppState> store,
  ) async {
    if (action is LoadConferencesAction) {
      _loadConferences(store);
    } else if (action is CreateConferenceAction) {
      _createConference(action, store);
    } else if (action is UpdateConferenceAction) {
      _updateConferences(action, store);
    } else if (action is DeleteConferenceAction) {
      _deleteConferences(action, store);
    }
  }

  Future<void> _createConference(
    CreateConferenceAction action,
    Store<AppState> store,
  ) async {
    try {
      await conferenceRepository.create(action.conference);
      final conferecesState = store.state.conferencesState;
      if (conferecesState is ConferencesLoaded) {
        store.dispatch(
          ConferencesLoadedAction(
            conferecesState.conferences..add(action.conference),
          ),
        );
      } else {
        store.dispatch(LoadActivitiesAction());
      }
      action.onSuccesed();
    } on Exception catch (e) {
      log('Create conference exception\n$e');
    }
  }

  Future<void> _loadConferences(Store<AppState> store) async {
    try {
      final conferences = await conferenceRepository.getAll();
      store.dispatch(ConferencesLoadedAction(conferences));
    } on Exception catch (_) {
      store.dispatch(ConferencesLoadingFailureAction());
    }
  }

  Future<void> _updateConferences(
    UpdateConferenceAction action,
    Store<AppState> store,
  ) async {
    try {
      await conferenceRepository.update(action.conference);
      store.dispatch(LoadActivitiesAction());
      action.onSuccesed();
    } on Exception catch (e) {
      // store.dispatch(ConferencesLoadingFailureAction());
      log('Update conference exception\n$e');
    }
  }

  Future<void> _deleteConferences(
    DeleteConferenceAction action,
    Store<AppState> store,
  ) async {
    try {
      await conferenceRepository.delete(action.conferenceId);
      store.dispatch(LoadActivitiesAction());
      action.onSuccesed();
    } on Exception catch (e) {
      // store.dispatch(ConferencesLoadingFailureAction());
      log('Delete conference exception\n$e');
    }
  }
}
