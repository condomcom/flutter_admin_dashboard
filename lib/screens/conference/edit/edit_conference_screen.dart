import 'package:admin/models/conference/conference.dart';
import 'package:admin/redux/redux.dart';
import 'package:admin/utils/di/di.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:redux/redux.dart';

class ConferenceEditScreen extends StatelessWidget {
  const ConferenceEditScreen({
    Key? key,
    this.conference,
  }) : super(key: key);

  final Conference? conference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          conference == null
              ? 'Добавление конференции'
              : 'Редактирование конференции',
        ),
      ),
      body: SingleChildScrollView(
        child: EditConferencePage(
          onComplete: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class EditConferencePage extends StatelessWidget {
  EditConferencePage({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  final Function() onComplete;

  final _shortNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                CommonTextField(
                  hintText: 'Краткое название',
                  controller: _shortNameController,
                ),
                const SizedBox(height: 10),
                CommonTextField(
                  hintText: 'Название',
                  controller: _nameController,
                ),
                const SizedBox(height: 10),
                CommonTextField(
                  hintText: 'Описание',
                  controller: _descriptionController,
                ),
              ],
            ),
            ResponsiveCenteredView(
              child: BottomButton(
                title: 'Сохранить',
                onTap: () {
                  final conference = Conference(
                    shortName: _shortNameController.text,
                    fullName: _nameController.text,
                    description: _descriptionController.text,
                  );
                  Get.get<Store<AppState>>().dispatch(
                    CreateConferenceAction(
                      conference,
                      onSuccesed: onComplete,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
