import 'package:admin/models/conference/conference.dart';

class ConferencesState {}

class ConferencesLoadingFailure extends ConferencesState {}

class ConferencesLoaded extends ConferencesState {
  ConferencesLoaded(this.conferences);
  final List<Conference> conferences;
}
