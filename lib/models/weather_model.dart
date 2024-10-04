import 'package:hive/hive.dart';
import 'package:weather_app/models/weather_forecast_day_model.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 0)
class Weather {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? conditionText;

  @HiveField(2)
  final double? temperature;

  @HiveField(3)
  final int? windDegree;

  @HiveField(4)
  final String? windDir;

  @HiveField(5)
  final double? windMph;

  @HiveField(6)
  final double? windKph;

  @HiveField(7)
  final int? humidity;

  @HiveField(8)
  final double? pressureIn;

  @HiveField(9)
  final double? pressureMb;

  @HiveField(10)
  final double? visibilityKm;

  @HiveField(11)
  final double? visibilityMiles;

  @HiveField(12)
  final String? conditionIcon;

  @HiveField(13)
  final String? date;

  @HiveField(14)
  final int? dateEpoch;

  @HiveField(15)
  final List<ForecastDay>? forecast;

  Weather(
      {required this.name,
      required this.conditionText,
      required this.temperature,
      required this.windDegree,
      required this.windDir,
      required this.windMph,
      required this.windKph,
      required this.humidity,
      required this.pressureIn,
      required this.pressureMb,
      required this.visibilityKm,
      required this.visibilityMiles,
      required this.conditionIcon,
      required this.date,
      required this.dateEpoch,
      required this.forecast});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['location']['name'],
      conditionText: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
      temperature: json['current']['temp_c'],
      windDegree: json['current']['wind_degree'],
      windDir: json['current']['wind_dir'],
      windMph: json['current']['wind_mph'],
      windKph: json['current']['wind_kph'],
      humidity: json['current']['humidity'],
      pressureIn: json['current']['pressure_in'],
      pressureMb: json['current']['pressure_mb'],
      visibilityKm: json['current']['vis_km'],
      visibilityMiles: json['current']['vis_miles'],
      date: json['current']['last_updated'],
      dateEpoch: json['current']['last_updated_epoch'],
      forecast: (json['forecast']['forecastday'] as List)
          .map((day) => ForecastDay.fromJson(day))
          .toList()
          .cast<ForecastDay>(),
    );
  }
}
