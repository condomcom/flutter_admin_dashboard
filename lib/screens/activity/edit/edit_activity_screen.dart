import 'package:admin/models/activity/activity.dart';
import 'package:admin/models/conference/conference.dart';
import 'package:admin/redux/app/activities/activities.dart';
import 'package:admin/redux/redux.dart';
import 'package:admin/utils/di/di.dart';
import 'package:admin/utils/formaters/formaters.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class ActivityEditScreen extends StatefulWidget {
  ActivityEditScreen({
    Key? key,
    this.activity,
  }) : super(key: key);

  final Activity? activity;

  @override
  State<ActivityEditScreen> createState() => _ActivityEditScreenState();
}

class _ActivityEditScreenState extends State<ActivityEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.activity == null
              ? 'Добавление активности'
              : 'Редактирование активности',
        ),
      ),
      body: SingleChildScrollView(
        child: ActivityEditPage(
          activity: widget.activity,
          onCompleted: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class ActivityEditPage extends StatefulWidget {
  const ActivityEditPage({
    Key? key,
    required this.onCompleted,
    this.activity,
  }) : super(key: key);

  final Activity? activity;
  final Function() onCompleted;

  @override
  State<ActivityEditPage> createState() => _ActivityEditPageState();
}

class _ActivityEditPageState extends State<ActivityEditPage> {
  final _shortNameController = TextEditingController();

  final _nameController = TextEditingController();

  final _descriptionController = TextEditingController();

  var _startDate = DateTime.now();
  var _finalDate = DateTime.now();
  var _currentSliderValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveCenteredView(
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
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(bottom: 0.0),
                      child: Text('Начало'),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(_startDate,
                          onSelect: (d) => setState(() => _startDate = d)),
                      child: Text(
                        DateTimeFormater.dateAndTime(_startDate),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(bottom: 0.0),
                      child: Text('Конец'),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(_finalDate,
                          onSelect: (d) => setState(() => _finalDate = d)),
                      child: Text(
                        DateTimeFormater.dateAndTime(_finalDate),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(bottom: 0.0),
                  child: Text(
                    'Количество участников ${_currentSliderValue.toInt()}',
                  ),
                ),
                Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 20,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
            ResponsiveCenteredView(
              child: BottomButton(
                padding: EdgeInsets.zero,
                title: 'Сохранить',
                onTap: _save,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _save() {
    if (widget.activity != null) {
      final activity = widget.activity!.copyWith(
        startsAt: _startDate,
        finishesAt: _finalDate,
        shortName: _shortNameController.text,
        fullName: _nameController.text,
        description: _descriptionController.text,
        participantsLimit: _currentSliderValue.toInt(),
      );
      Get.get<Store<AppState>>().dispatch(UpdateActivityAction(
        activity,
        onSuccesed: widget.onCompleted,
      ));
      return;
    }

    final activity = Activity(
      startsAt: _startDate,
      finishesAt: _finalDate,
      shortName: _shortNameController.text,
      fullName: _nameController.text,
      description: _descriptionController.text,
      participantsLimit: _currentSliderValue.toInt(),
    );
    Get.get<Store<AppState>>().dispatch(CreateActivityAction(
      activity,
      onSuccesed: widget.onCompleted,
    ));
  }

  Future<void> _selectDate(
    DateTime date, {
    required Function(DateTime date) onSelect,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(picked ?? date),
    );

    if (picked != null && picked != date)
      onSelect(
        DateTime(
          picked.year,
          picked.month,
          picked.day,
          timeOfDay?.hour ?? DateTime.now().hour,
          timeOfDay?.minute ?? DateTime.now().minute,
        ),
      );
  }
}
