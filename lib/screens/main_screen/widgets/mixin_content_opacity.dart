import 'dart:math';

mixin ContentOpacity {
  double contentOpacity(double shrinkOffset, double maxExtent) {
    return 1 - max(0.0, shrinkOffset) / maxExtent;
  }
}
