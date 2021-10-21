import 'dart:async';

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
      _foundUserAction(action, store);
    }
    next(action);
  }

  Future<void> _foundUserAction(
    ConferencesAction action,
    Store<AppState> store,
  ) async {
    if (action is LoadConferencesAction) {
      _loadConferences(store);
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