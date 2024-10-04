import 'package:hive/hive.dart';

part 'weather_forecast_hour_model.g.dart';

@HiveType(typeId: 1) // Use a different typeId
class ForecastHour {
  @HiveField(0)
  final int? timeEpoch;

  @HiveField(1)
  final String? time;

  @HiveField(2)
  final double? tempC;

  @HiveField(3)
  final double? tempF;

  @HiveField(4)
  final String? conditionText;

  @HiveField(5)
  final String? conditionIcon;

  @HiveField(6)
  final double? windMph;

  @HiveField(7)
  final double? windKph;

  @HiveField(8)
  final int? windDegree;

  @HiveField(9)
  final String? windDir;

  @HiveField(10)
  final double? pressureMb;

  @HiveField(11)
  final double? pressureIn;

  @HiveField(12)
  final int? humidity;

  @HiveField(13)
  final double? visibilityKm;

  @HiveField(14)
  final double? visibilityMiles;

  ForecastHour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
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
      tempC: json['temp_c'],
      tempF: json['temp_f'],
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
