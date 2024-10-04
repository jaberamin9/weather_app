import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/weather_forecast_day_model.dart';
import 'models/weather_forecast_hour_model.dart';
import 'models/weather_model.dart';
import 'views/weather_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(ForecastDayAdapter());
  Hive.registerAdapter(ForecastHourAdapter());
  await Hive.openBox<Weather>('weatherBox');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherView(),
    );
  }
}
