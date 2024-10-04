String convertEpochToDate(int epoch) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
  String formattedDate = '${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  return formattedDate;
}