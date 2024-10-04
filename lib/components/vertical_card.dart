import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../utils/convert_epoch_to_time.dart';

class VerticalCard extends StatelessWidget {
  final Weather weather;
  final int nextDayValue;
  final int index;
  final int idx;
  final bool isChecked;

  const VerticalCard(
      {super.key,
      required this.weather,
      required this.nextDayValue,
      required this.index,
      required this.idx,
      required this.isChecked});

  @override
  Widget build(BuildContext context) {
    String temp;
    if (isChecked) {
      temp = "${weather.forecast?[nextDayValue].hour?[index].tempF?.toInt()}F";
    } else {
      temp = "${weather.forecast?[nextDayValue].hour?[index].tempC?.toInt()}°C";
    }
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 90,
                height: 210,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFF91a3e4)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            convertEpochToTime(weather.forecast?[nextDayValue]
                                    .hour?[index].timeEpoch ??
                                0),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
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
                                value: loadingProgress.expectedTotalBytes !=
                                        null
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
                        Text(temp,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ]),
                )),
            const SizedBox(height: 10),
            if (idx == index)
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
              )
          ],
        ));
  }
}
