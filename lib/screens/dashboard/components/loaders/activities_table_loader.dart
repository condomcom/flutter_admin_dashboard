import 'package:admin/redux/app/activities/state.dart';
import 'package:admin/redux/redux.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ActivitiesTableLoader extends StatelessWidget {
  const ActivitiesTableLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(converter: (store) {
      return store.state;
    }, builder: (BuildContext context, AppState state) {
      if (state.activitiesState is ActivitiesLoaded) {
        return ActivitiesTable(
          activities: (state.activitiesState! as ActivitiesLoaded).activities,
        );
      }
      return CircularProgressIndicator();
    });
  }
}
