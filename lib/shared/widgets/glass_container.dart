import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? blur;
  final double? alpha;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.blur = 6,
    this.alpha = 0.2,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur!, sigmaY: blur!),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: alpha!),
          borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
          border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1.2),
        ),
        child: child,
      ),
    ),
  );
}
