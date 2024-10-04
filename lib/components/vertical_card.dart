import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../utils/convert_epoch_to_time.dart';

class VerticalCard extends StatelessWidget {
  final Weather weather;
  final int nextDayValue;
  final int index;

  const VerticalCard(
      {super.key,
      required this.weather,
      required this.nextDayValue,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: 100,
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xFF91a3e4)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      convertEpochToTime(weather
                              .forecast?[nextDayValue].hour?[index].timeEpoch ??
                          0),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Image.network(
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    'https:${weather.forecast?[nextDayValue].hour?[index].conditionIcon}',
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
                      '${weather.forecast?[nextDayValue].hour?[index].temperature?.toInt()}°',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ]),
          )),
    );
  }
}
