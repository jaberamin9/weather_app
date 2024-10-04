import 'package:hive/hive.dart';
import '../models/weather_model.dart';

class WeatherDbService {
  final String _boxName = 'weatherBox';

  Future<void> saveWeatherToLocal(Weather weather) async {
    var box = await Hive.openBox<Weather>(_boxName);
    await box.put('weather', weather);
  }

  Weather? getWeatherFromLocal() {
    var box = Hive.box<Weather>(_boxName);
    return box.get('weather');
  }
}
