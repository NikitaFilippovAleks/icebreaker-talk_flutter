import 'dart:async';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/loader/index.dart';

class PullRefresh extends StatelessWidget {
  const PullRefresh({super.key, required this.child, required this.onRefresh});

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) => CustomRefreshIndicator(
    onRefresh: onRefresh,
    builder: (context, child, controller) => Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        child,
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            final visible = controller.value > 0 || controller.isLoading;
            if (!visible) return const SizedBox.shrink();
            final top = controller.isLoading ? 0.0 : 20.0 * (controller.value - 1);
            final scale = Tween<double>(begin: 0.01, end: 1).animate(controller);
            return Positioned(
              top: top,
              left: 0,
              right: 0,
              height: 40.h,
              child: Center(
                child: ScaleTransition(scale: scale, child: const Loader(size: 38)),
              ),
            );
          },
        ),
      ],
    ),
    child: child,
  );
}
