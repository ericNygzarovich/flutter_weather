import 'package:flutter/material.dart';

import '../../../bloc/weather_bloc.dart';
import 'degrees_circle.dart';
import 'mixin_content_opacity.dart';

class EdgeForecastForTheDay extends SliverPersistentHeaderDelegate
    with ContentOpacity {
  final WeatherState state;
  double maxExtents;
  double minExtants;

  EdgeForecastForTheDay({
    required this.maxExtents,
    required this.minExtants,
    required this.state,
  });

  @override
  double get maxExtent => maxExtents;

  @override
  double get minExtent => minExtants;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Color contentColor = const Color.fromRGBO(250, 255, 255, 1).withOpacity(
      contentOpacity(shrinkOffset, maxExtent),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LimDegrees(
          limName: 'Макс',
          limTemp: state.maxTemp,
          color: contentColor,
        ),
        const SizedBox(width: 5),
        Text(
          ',',
          style: TextStyle(
            color: contentColor,
            fontSize: maxExtent,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        LimDegrees(
          limName: 'мин',
          limTemp: state.minTemp,
          color: contentColor,
        ),
      ],
    );
  }
}

class LimDegrees extends StatelessWidget {
  final int limTemp;
  final String limName;
  final Color color;

  const LimDegrees({
    super.key,
    required this.limTemp,
    required this.limName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$limName.: $limTemp',
          style: TextStyle(
            color: color,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: CustomPaint(
            painter: DegreesCircle(
              size: 5,
              width: 2,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
