import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/weather_controller.dart';
import '../models/weather_model.dart';

class WeatherView extends ConsumerWidget {
  final TextEditingController searchValue = TextEditingController(text: "");
  static bool isWeatherFetched = false;

  WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);

    if (!isWeatherFetched) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(weatherProvider.notifier).fetchWeather(searchValue.text);
      });
      isWeatherFetched = true;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF92a6fb),
              Color(0xFF2949a9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  width: double.maxFinite,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: TextField(
                            controller: searchValue,
                            decoration: InputDecoration(
                              hintText: 'Enter city name',
                              filled: true,
                              fillColor: Colors.grey[200],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  // Border color when focused
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  // Border color when focused
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        )),
                        IconButton(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          onPressed: () {
                            ref
                                .read(weatherProvider.notifier)
                                .fetchWeather(searchValue.text);
                            searchValue.clear();
                          },
                          icon: const Icon(Icons.search),
                          color: Colors.black,
                        )
                      ],
                    ),
                  )),
              weatherState.when(
                data: (weather) => WeatherDisplay(weather: weather),
                loading: () =>
                    const CircularProgressIndicator(color: Colors.white),
                error: (err, stack) => Text('Error: $err'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
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
              'https:${weather.conditionIcon}',
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
              '${weather.temperature?.toInt()}°C',
              style: const TextStyle(fontSize: 48, color: Colors.white),
            )
          ],
        ),
        Text(
          '${weather.conditionText}',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        )
      ],
    );
  }
}
