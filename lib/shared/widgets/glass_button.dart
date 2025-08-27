import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'glass_container.dart';

class GlassButton extends StatelessWidget {
  const GlassButton({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => GlassContainer(
    alpha: 0.3,
    child: Padding(padding: EdgeInsets.all(6.r), child: child),
  );
}
