import 'package:admin/models/conference/conference.dart';
import 'package:admin/redux/redux.dart';
import 'package:admin/utils/di/di.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class ConferenceEditScreen extends StatelessWidget {
  ConferenceEditScreen({
    Key? key,
    this.conference,
  }) : super(key: key);

  final Conference? conference;

  final _shortNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ResponsiveCenteredView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
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
              ),
            ),
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
                    onSuccesed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
