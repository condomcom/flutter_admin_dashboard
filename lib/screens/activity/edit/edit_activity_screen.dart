import 'package:admin/models/activity/activity.dart';
import 'package:admin/models/conference/conference.dart';
import 'package:admin/redux/app/activities/activities.dart';
import 'package:admin/redux/redux.dart';
import 'package:admin/utils/di/di.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class ActivityEditScreen extends StatelessWidget {
  ActivityEditScreen({
    Key? key,
    this.activity,
  }) : super(key: key);

  final Activity? activity;

  final _shortNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          activity == null
              ? 'Добавление активности'
              : 'Редактирование активности',
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
          BottomButton(
            title: 'Сохранить',
            onTap: () {
              final activity = Activity(
                shortName: _shortNameController.text,
                fullName: _nameController.text,
                description: _descriptionController.text,
              );
              Get.get<Store<AppState>>().dispatch(CreateActivityAction(
                activity,
                onSuccesed: () {
                  Navigator.pop(context);
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
