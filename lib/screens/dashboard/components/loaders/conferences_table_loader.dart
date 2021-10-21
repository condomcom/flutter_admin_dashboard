import 'package:admin/redux/redux.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ConferencesTableLoader extends StatelessWidget {
  const ConferencesTableLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(converter: (store) {
      return store.state;
    }, builder: (BuildContext context, AppState state) {
      if (state.conferencesState is ConferencesLoaded) {
        return ConferencesTable(
            conferences:
                (state.conferencesState! as ConferencesLoaded).conferences);
      }
      return CircularProgressIndicator();
    });
  }
}
