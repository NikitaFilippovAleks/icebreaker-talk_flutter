import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'glass_container.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.child, this.width, this.height});
  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) => GlassContainer(
    alpha: 0.2,
    borderRadius: 21.r,
    width: width,
    height: height,
    child: Padding(padding: EdgeInsets.all(12.r), child: child),
  );
}
