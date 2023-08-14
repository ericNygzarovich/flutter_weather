import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_flutter/models/week_forecast_parametrs.dart';

import 'degrees_circle.dart';
import 'horizontal_display_of_degrees.dart';

class DayForecastItem extends StatelessWidget {
  final String weekday;
  final int maxTemp;
  final int minTemp;
  final String icon;
  final int currentTemValue;
  final WeekForecastParametrs weekForecastParametrs;

  const DayForecastItem({
    super.key,
    required this.weekForecastParametrs,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.weekday,
    this.currentTemValue = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            weekday.length == 1 ? _weekday(int.parse(weekday)) : weekday,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(253, 251, 253, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SvgPicture.network('https://yastatic.net/weather/i/icons/funky/dark/$icon.svg'),
        const SizedBox(width: 30),
        Row(
          children: [
            Text(
              minTemp.toString(),
              style: const TextStyle(
                color: Color.fromRGBO(174, 153, 172, 1),
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomPaint(
              painter: DegreesCircle(
                color: const Color.fromRGBO(174, 153, 172, 1),
                size: 5,
                width: 2,
              ),
              size: const Size(0, 14),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomPaint(
            painter: HorizontalDisplayOfDegrees(
              currentTemValue,
              renderParametrs: weekForecastParametrs,
              thisDayMaxTemp: maxTemp,
              thisDayMinTemp: minTemp,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          maxTemp.toString(),
          style: const TextStyle(
            color: Color.fromRGBO(253, 251, 253, 1),
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomPaint(
          painter: DegreesCircle(color: const Color.fromRGBO(253, 251, 253, 1), size: 5, width: 2),
          size: const Size(0, 14),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

String _weekday(int weekday) {
  switch (weekday) {
    case 1:
      return 'Пн';
    case 2:
      return 'Вт';
    case 3:
      return 'Ср';
    case 4:
      return 'Чт';
    case 5:
      return 'Пт';
    case 6:
      return 'Сб';
    case 7:
      return 'Вс';

    default:
      return weekday.toString();
  }
}
