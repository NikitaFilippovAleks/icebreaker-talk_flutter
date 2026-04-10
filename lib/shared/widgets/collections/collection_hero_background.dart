import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/string.dart';

class CollectionHeroBackground extends StatelessWidget {
  const CollectionHeroBackground({
    super.key,
    required this.id,
    required this.color,
    required this.child,
    this.isFullScreen = false,
  });

  final String id;
  final String color;
  final Widget child;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) => Hero(
    tag: 'collection_background_$id',
    child: Container(
      decoration: BoxDecoration(
        color: color.toColor(),
        borderRadius: isFullScreen ? null : BorderRadius.circular(24.r),
      ),
      padding: isFullScreen ? null : EdgeInsets.all(4.r),
      child: child,
    ),
  );
}
