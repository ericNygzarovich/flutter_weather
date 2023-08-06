import 'package:flutter/material.dart';

import '../../../bloc/weather_bloc.dart';
import 'degrees_circle.dart';
import 'mixin_content_opacity.dart';

class CurrentTempDelegate extends SliverPersistentHeaderDelegate
    with ContentOpacity {
  final WeatherState state;
  double maxExtents;
  double minExtants;

  CurrentTempDelegate({
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
    Color contentColor = const Color.fromRGBO(254, 254, 252, 1)
        .withOpacity(contentOpacity(shrinkOffset, maxExtent));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${state.currentTemp}',
          style: TextStyle(
            fontSize: maxExtent,
            fontWeight: FontWeight.w200,
            color: contentColor,
          ),
        ),
        const SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.only(top: 22),
          child: CustomPaint(
            painter: DegreesCircle(
              size: 20,
              width: 3,
              color: contentColor,
            ),
          ),
        ),
      ],
    );
  }
}
