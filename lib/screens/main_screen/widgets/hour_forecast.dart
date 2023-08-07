import 'package:flutter/material.dart';

import 'degrees_circle.dart';

class HourForecast extends StatelessWidget {
  final int hour;
  final IconData iconData;
  final int temp;

  const HourForecast({
    super.key,
    required this.hour,
    required this.iconData,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$hour',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Icon(
          iconData,
          size: 28,
          color: const Color.fromRGBO(255, 255, 254, 1),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$temp',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 2),
            CustomPaint(
              painter: DegreesCircle(color: Colors.white, size: 5, width: 2),
              size: const Size(0, 13),
            ),
          ],
        )
      ],
    );
  }
}
