import 'package:admin/redux/app/app.dart';
import 'package:redux/redux.dart';

class AppMiddleware implements MiddlewareClass<AppState> {
  const AppMiddleware();

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is LoadAll) {
      store.dispatch(LoadUsersAction());
      store.dispatch(LoadConferencesAction());
    }
    next(action);
  }
}
