import 'dart:async';

import 'package:admin/redux/app/app.dart';
import 'package:redux/redux.dart';

class AppMiddleware implements MiddlewareClass<AppState> {
  const AppMiddleware();

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    // if (action is UserAction) {
    //   _getMoreAuthors(store);
    // }

    next(action);
  }

  // Future<void> _getMoreAuthors(Store<AppState> store) async {
  //   try {
  //     store.dispatch('');
  //   } on Exception catch (e, st) {
  //     store.dispatch('');
  //   }
  // }
}
