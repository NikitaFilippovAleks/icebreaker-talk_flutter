import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../glass_container.dart';

enum ButtonsGlassVariant { round, square }

class ButtonsGlass extends StatelessWidget {
  const ButtonsGlass({
    super.key,
    required this.child,
    this.onPressed,
    this.padding,
    this.borderRadius,
    this.variant = ButtonsGlassVariant.round,
  });
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? borderRadius;
  final ButtonsGlassVariant variant;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onPressed,
    child: GlassContainer(
      alpha: 0.3,
      borderRadius: borderRadius ?? (variant == ButtonsGlassVariant.round ? 100.r : 8.r),
      child: Padding(padding: padding ?? EdgeInsets.all(6.r), child: child),
    ),
  );
}
