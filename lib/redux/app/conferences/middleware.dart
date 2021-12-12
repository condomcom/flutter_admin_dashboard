import 'dart:async';
import 'dart:developer';

import 'package:admin/redux/app/actions.dart';
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
}
