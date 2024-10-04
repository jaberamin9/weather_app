import 'package:hive/hive.dart';

part 'weather_forecast_hour_model.g.dart';

@HiveType(typeId: 1) // Use a different typeId
class ForecastHour {
  @HiveField(0)
  final int? timeEpoch;

  @HiveField(1)
  final String? time;

  @HiveField(2)
  final double? temperature;

  @HiveField(3)
  final String? conditionText;

  @HiveField(4)
  final String? conditionIcon;

  @HiveField(5)
  final double? windMph;

  @HiveField(6)
  final double? windKph;

  @HiveField(7)
  final int? windDegree;

  @HiveField(8)
  final String? windDir;

  @HiveField(9)
  final double? pressureMb;

  @HiveField(10)
  final double? pressureIn;

  @HiveField(11)
  final int? humidity;

  @HiveField(12)
  final double? visibilityKm;

  @HiveField(13)
  final double? visibilityMiles;

  ForecastHour({
    required this.timeEpoch,
    required this.time,
    required this.temperature,
    required this.conditionText,
    required this.conditionIcon,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.humidity,
    required this.visibilityKm,
    required this.visibilityMiles,
  });

  factory ForecastHour.fromJson(Map<String, dynamic> json) {
    return ForecastHour(
      timeEpoch: json['time_epoch'],
      time: json['time'],
      temperature: json['temp_c'],
      conditionText: json['condition']['text'],
      conditionIcon: json['condition']['icon'],
      windMph: json['wind_mph'],
      windKph: json['wind_kph'],
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: json['pressure_mb'],
      pressureIn: json['pressure_in'],
      humidity: json['humidity'],
      visibilityKm: json['vis_km'],
      visibilityMiles: json['vis_miles'],
    );
  }
}
