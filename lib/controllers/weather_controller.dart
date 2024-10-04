import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location_service.dart';
import '../models/weather_model.dart';
import '../services/weather_api_service.dart';
import '../services/weather_db_service.dart';

final weatherProvider =
    StateNotifierProvider<WeatherController, AsyncValue<Weather>>((ref) {
  return WeatherController(
      apiService: WeatherApiService(),
      dbService: WeatherDbService(),
      locationService: LocationService());
});

class WeatherController extends StateNotifier<AsyncValue<Weather>> {
  final WeatherApiService apiService;
  final WeatherDbService dbService;
  final LocationService locationService;

  WeatherController(
      {required this.apiService,
      required this.dbService,
      required this.locationService})
      : super(const AsyncValue.loading()) {
    loadWeatherFromLocal();
  }

  Future<void> fetchWeather(String location) async {
    try {
      state = const AsyncValue.loading();
      Position position = await locationService.getCurrentLocation();
      final weather = await apiService.fetchWeather(location.isEmpty
          ? '${position.latitude},${position.longitude}'
          : location);
      await dbService.saveWeatherToLocal(weather);
      state = AsyncValue.data(weather);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void loadWeatherFromLocal() {
    final weather = dbService.getWeatherFromLocal();
    if (weather != null) {
      state = AsyncValue.data(weather);
    } else {
      state = AsyncValue.error('No local data found', StackTrace.current);
    }
  }
}
