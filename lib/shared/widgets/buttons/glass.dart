import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../glass_container.dart';

enum ButtonsGlassVariant { round, square }

class ButtonsGlass extends StatefulWidget {
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
  State<ButtonsGlass> createState() => _ButtonsGlassState();
}

class _ButtonsGlassState extends State<ButtonsGlass> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.90,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapDown: (_) {
      _animationController.forward();
    },
    onTapUp: (_) {
      _animationController.reverse();
    },
    onTapCancel: () {
      _animationController.reverse();
    },
    onTap: widget.onPressed,
    child: AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) => Transform.scale(
        scale: _scaleAnimation.value,
        child: GlassContainer(
          alpha: 0.3,
          borderRadius:
              widget.borderRadius ?? (widget.variant == ButtonsGlassVariant.round ? 100.r : 8.r),
          child: Padding(padding: widget.padding ?? EdgeInsets.all(6.r), child: widget.child),
        ),
      ),
    ),
  );
}
