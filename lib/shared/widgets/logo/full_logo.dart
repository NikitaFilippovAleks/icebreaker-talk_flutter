import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/gen/assets.gen.dart';
import '../loader/index.dart';

class FullLogo extends StatelessWidget {
  const FullLogo({super.key});

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
            child: const Center(child: Loader(size: 38, isAnimated: false)),
          ),
          Center(
            child: Row(
              spacing: 16.w,
              children: [
                Assets.icons.logoLetters.icebreaker.svg(height: 13.h),
                Assets.icons.logoLetters.talk.svg(height: 13.h, width: 28.w),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
