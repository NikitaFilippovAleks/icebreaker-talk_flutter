import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/gen/assets.gen.dart';
import '../loader/index.dart';

class FullLogo extends StatefulWidget {
  const FullLogo({super.key});

  @override
  State<FullLogo> createState() => _FullLogoState();
}

class _FullLogoState extends State<FullLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimationIcebreaker;
  late Animation<double> _opacityAnimationTalk;
  late Animation<double> _opacityAnimationLogo;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    _opacityAnimationIcebreaker = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );
    _opacityAnimationTalk = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeIn),
      ),
    );
    _opacityAnimationLogo = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.2, curve: Curves.easeIn),
      ),
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => IntrinsicWidth(
    child: SizedBox(
      height: 26.h,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 38.w,
            bottom: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: _opacityAnimationLogo,
                builder: (context, child) => Opacity(
                  opacity: _opacityAnimationLogo.value,
                  child: const Loader(size: 38, isAnimated: false),
                ),
              ),
            ),
          ),

          Center(
            child: Row(
              spacing: 16.w,
              children: [
                AnimatedBuilder(
                  animation: _opacityAnimationIcebreaker,
                  builder: (context, child) => Opacity(
                    opacity: _opacityAnimationIcebreaker.value,
                    child: Assets.icons.logoLetters.icebreaker.svg(height: 13.h),
                  ),
                ),
                AnimatedBuilder(
                  animation: _opacityAnimationTalk,
                  builder: (context, child) => Opacity(
                    opacity: _opacityAnimationTalk.value,
                    child: Assets.icons.logoLetters.talk.svg(height: 13.h, width: 28.w),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
