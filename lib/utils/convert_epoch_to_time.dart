import 'package:intl/intl.dart';

String convertEpochToTime(int timeEpoch) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeEpoch * 1000);
  String formattedTime = DateFormat('h a').format(dateTime);
  return formattedTime;
}