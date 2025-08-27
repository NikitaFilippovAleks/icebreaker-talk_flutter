import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(21.r)),
    padding: EdgeInsets.all(12.r),
    child: child,
  );
}
