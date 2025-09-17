import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/theme/theme.dart';

class Loader extends StatefulWidget {
  const Loader({super.key, this.size, this.isAnimated = true});
  final double? size;
  final bool isAnimated;

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<Color?> _leftColorAnimation;
  late Animation<Color?> _rightColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final theme = context.customTheme;

    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rightColorAnimation = ColorTween(
      begin: theme.loader2Right,
      end: theme.loader1Left,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _leftColorAnimation = ColorTween(
      begin: theme.loader2Left,
      end: theme.loader1Right,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.isAnimated) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get _size => widget.size ?? 60;
  double get _width => _size;
  double get _circleSize => 2 / 3 * _size;
  double get _circleRoute => 1 / 3 * _size;

  @override
  Widget build(BuildContext context) => Center(
    child: SizedBox(
      width: _width.w,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Stack(
          alignment: Alignment.center,
          children: [
            // Left circle
            Positioned(
              left: _positionAnimation.value * _circleRoute.w,
              child: Container(
                width: _circleSize.w,
                height: _circleSize.w,
                decoration: BoxDecoration(
                  color: _leftColorAnimation.value?.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Right circle
            Positioned(
              right: _positionAnimation.value * _circleRoute.w,
              child: Container(
                width: _circleSize.w,
                height: _circleSize.w,
                decoration: BoxDecoration(
                  color: _rightColorAnimation.value?.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
