import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
abstract class DateTimeFormater {
  static String dateAndTime(DateTime date) {
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }
}
