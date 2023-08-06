import 'package:flutter/material.dart';

import 'mixin_content_opacity.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate
    with ContentOpacity {
  final bool? isHeader;
  double maxExtents;
  double minExtents;
  String title;

  HeaderDelegate({
    this.isHeader = false,
    required this.maxExtents,
    required this.minExtents,
    required this.title,
  });

  @override
  double get maxExtent => maxExtents;

  @override
  double get minExtent => minExtents;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Color changesOpacityColor = const Color.fromARGB(0, 250, 255, 255)
        .withOpacity(contentOpacity(shrinkOffset, maxExtent));
    Color regularColor = const Color.fromRGBO(250, 255, 255, 1);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        title,
        style: TextStyle(
          color: isHeader! ? regularColor : changesOpacityColor,
          fontSize: isHeader! ? 30 : maxExtent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
