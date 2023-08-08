import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'degrees_circle.dart';

class HourForecastItem extends StatelessWidget {
  final String hour;
  final String icon;
  final int temp;

  const HourForecastItem({
    super.key,
    required this.hour,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          hour,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        SvgPicture.network(
            'https://yastatic.net/weather/i/icons/funky/dark/$icon.svg'),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$temp',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
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
