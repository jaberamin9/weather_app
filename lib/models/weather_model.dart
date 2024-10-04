import 'package:hive/hive.dart';
import 'package:weather_app/models/weather_forecast_day_model.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 0)
class Weather {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? country;

  @HiveField(2)
  final String? date;

  @HiveField(3)
  final int? dateEpoch;

  @HiveField(4)
  final List<ForecastDay>? forecast;

  Weather(
      {required this.name,
      required this.country,
      required this.date,
      required this.dateEpoch,
      required this.forecast});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['location']['name'],
      country: json['location']['country'],
      date: json['current']['last_updated'],
      dateEpoch: json['current']['last_updated_epoch'],
      forecast: (json['forecast']['forecastday'] as List)
          .map((day) => ForecastDay.fromJson(day))
          .toList()
          .cast<ForecastDay>(),
    );
  }
}
