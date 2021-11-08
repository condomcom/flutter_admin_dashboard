import 'package:admin/models/conference/conference.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
                  ),
                  const SizedBox(height: 10),
                  CommonTextField(
                    hintText: 'Название',
                  ),
                  const SizedBox(height: 10),
                  CommonTextField(
                    hintText: 'Описание',
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'Сохранить',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
