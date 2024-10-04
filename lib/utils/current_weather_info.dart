import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_forecast_hour_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/convert_epoch_to_time.dart';

List<dynamic>? currentWeatherInfo(Weather weather, int day) {
  List<ForecastHour>? hours = weather.forecast?[day].hour;
  DateTime now = DateTime.now();
  String formattedTime = DateFormat('h a').format(now);
  for (int i = 0; i < hours!.length; i++) {
    if (convertEpochToTime(hours[i].timeEpoch ?? 0) == formattedTime) {
      return [hours[i], i];
    }
  }
  return null;
}
