import 'package:flutter/material.dart';
import 'package:weather_flutter/screens/main_screen/widgets/degrees_circle.dart';

class TenDaysForecast extends StatelessWidget {
  const TenDaysForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(57, 61, 107, 0.382),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Color.fromARGB(255, 155, 155, 155),
                  size: 19,
                ),
                SizedBox(width: 5),
                Text(
                  'ПРОГНОЗ ПОГОДЫ НА 10 ДН',
                  style: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
                )
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 155, 155, 155),
            ),
            Expanded(
              child: ListView.separated(
                //physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const DayForecastItem();
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Color.fromARGB(255, 155, 155, 155),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DayForecastItem extends StatelessWidget {
  const DayForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Text(
            'Пн',
            style: TextStyle(
              fontSize: 23,
              color: Color.fromRGBO(253, 251, 253, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Icon(
          Icons.thunderstorm,
          color: Color.fromRGBO(253, 251, 253, 1),
        ),
        const SizedBox(width: 50),
        Row(
          children: [
            const Text(
              '17',
              style: TextStyle(
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
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: CustomPaint(
              painter: HorizontalDisplayOfDegrees(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          '28',
          style: TextStyle(
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

class HorizontalDisplayOfDegrees extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color.fromRGBO(251, 158, 15, 1);
    paint.strokeWidth = 5;

    canvas.drawLine(const Offset(10, 10), const Offset(10, 10), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//  LinearProgressIndicator(
//               minHeight: 5,
//               backgroundColor: Color.fromRGBO(81, 67, 85, 1),
//               color: Color.fromRGBO(251, 158, 15, 1),
//               value: 0.7,
//             ),