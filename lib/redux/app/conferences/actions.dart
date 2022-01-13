import 'package:admin/models/conference/conference.dart';
import 'package:admin/redux/app/actions.dart';

class LoadConferencesAction extends ConferencesAction {}

class CreateConferenceAction extends ConferencesAction {
  CreateConferenceAction(this.conference, {required this.onSuccesed});
  final Conference conference;
  final Function() onSuccesed;
}

class ConferencesLoadedAction extends ConferencesAction {
  ConferencesLoadedAction(this.conferences);
  final List<Conference> conferences;
}

class UpdateConferenceAction extends ConferencesAction {
  UpdateConferenceAction(this.conference, {required this.onSuccesed});
  final Conference conference;
  final Function() onSuccesed;
}

class DeleteConferenceAction extends ConferencesAction {
  DeleteConferenceAction(this.conferenceId, {required this.onSuccesed});
  final String conferenceId;
  final Function() onSuccesed;
}

class ConferencesLoadingFailureAction extends ConferencesAction {}
