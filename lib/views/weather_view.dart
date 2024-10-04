import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/toggle_search_box_controller.dart';
import 'package:weather_app/views/weather_info.dart';
import '../controllers/weather_controller.dart';

class WeatherView extends ConsumerWidget {
  final TextEditingController searchValue = TextEditingController(text: "");
  static bool isWeatherFetched = false;

  WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);
    final isVisibleSearchBox = ref.watch(toggleSearchBoxProvider);

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
                  child: !isVisibleSearchBox
                      ? IconButton(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          onPressed: () {
                            ref
                                .read(toggleSearchBoxProvider.notifier)
                                .toggleSearchBox();
                          },
                          icon: const Icon(Icons.search),
                          color: Colors.white,
                        )
                      : Container(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                onPressed: () {
                                  ref
                                      .read(weatherProvider.notifier)
                                      .fetchWeather(searchValue.text);
                                  ref
                                      .read(toggleSearchBoxProvider.notifier)
                                      .toggleSearchBox();
                                  searchValue.clear();
                                },
                                icon: const Icon(Icons.search),
                                color: Colors.black,
                              ),
                              IconButton(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                onPressed: () {
                                  ref
                                      .read(toggleSearchBoxProvider.notifier)
                                      .toggleSearchBox();
                                  searchValue.clear();
                                },
                                icon: const Icon(Icons.close),
                                color: Colors.black,
                              )
                            ],
                          ),
                        )),
              weatherState.when(
                data: (weather) => WeatherInfo(weather: weather),
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
