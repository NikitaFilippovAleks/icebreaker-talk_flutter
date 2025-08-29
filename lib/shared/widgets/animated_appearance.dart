import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedAppearance extends StatefulWidget {
  const AnimatedAppearance({super.key, required this.child, this.appearanceDelay});

  final Widget child;
  final Duration? appearanceDelay;

  @override
  State<AnimatedAppearance> createState() => _AnimatedAppearanceState();
}

class _AnimatedAppearanceState extends State<AnimatedAppearance>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));

    if (widget.appearanceDelay != null) {
      Future.delayed(widget.appearanceDelay!, () {
        if (mounted) {
          _animationController.forward();
        }
      });
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _animationController,
    builder: (context, child) => Transform.scale(scale: _scaleAnimation.value, child: widget.child),
  );
}
