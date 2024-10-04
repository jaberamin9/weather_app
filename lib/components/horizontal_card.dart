import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  final String tag1, tag2, tag3;
  final String value1, value2, value3;

  const HorizontalCard(
      {super.key,
      required this.tag1,
      required this.tag2,
      required this.tag3,
      required this.value1,
      required this.value2,
      required this.value3});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF91a3e4)),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.air,
            color: Colors.white,
            size: 40,
          ),
          Column(
            children: [
              Text(tag1,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Text(value1,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Text(tag2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Text(value2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Text(tag3,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Text(value3,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}
