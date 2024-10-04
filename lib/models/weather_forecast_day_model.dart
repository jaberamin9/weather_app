import 'package:hive/hive.dart';
import 'package:weather_app/models/weather_forecast_hour_model.dart';
part 'weather_forecast_day_model.g.dart';

@HiveType(typeId: 2) // Use a different typeId
class ForecastDay {
  @HiveField(0)
  final String? date;

  @HiveField(1)
  final int? dateEpoch;

  @HiveField(2)
  final List<ForecastHour>? hour;

  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      dateEpoch: json['date_epoch'],
      hour: (json['hour'] as List)
          .map((hour) => ForecastHour.fromJson(hour))
          .toList()
          .cast<ForecastHour>(),
    );
  }
}
