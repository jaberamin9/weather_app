import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/components/vertical_card.dart';
import 'package:weather_app/controllers/next_day_controller.dart';
import 'package:weather_app/utils/convert_epoch_to_date.dart';
import 'package:weather_app/utils/convert_epoch_to_time.dart';
import '../models/weather_model.dart';
import '../utils/current_weather_info.dart';

class WeatherInfo extends ConsumerWidget {
  final Weather weather;

  const WeatherInfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextDayValue = ref.watch(nextDayProvider);
    final currentWeatherInformation = currentWeatherInfo(weather, nextDayValue);
    final currentWeather = currentWeatherInformation?[0];
    final idx = currentWeatherInformation?[1];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Text(
          weather.name ?? "name",
          style: const TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => {},
          child:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.location_on,
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 5),
            Text(
              'Current Location',
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              'https:${currentWeather?.conditionIcon}',
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('Failed');
              },
            ),
            Text(
              '${currentWeather?.temperature?.toInt()}°C',
              style: const TextStyle(fontSize: 48, color: Colors.white),
            )
          ],
        ),
        Text(
          '${currentWeather?.conditionText}',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(0),
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFF6e85d6)),
              ),
              child: Text(
                  (convertEpochToDate(weather.dateEpoch ?? 0) ==
                          weather.forecast?[nextDayValue].date)
                      ? 'Today'
                      : weather.forecast?[nextDayValue].date ?? '',
                  style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                ref.read(nextDayProvider.notifier).nextDay();
              },
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(0),
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFF3e58ac)),
              ),
              child:
                  const Text('Next Day', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
            width: double.maxFinite,
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weather.forecast?[nextDayValue].hour?.length,
              itemBuilder: (context, index) {
                return VerticalCard(
                    weather: weather, nextDayValue: nextDayValue, index: index);
              },
            )),
      ],
    );
  }
}
