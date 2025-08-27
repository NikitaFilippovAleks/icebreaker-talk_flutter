import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/gen/assets.gen.dart';
import 'glass_container.dart';

class GlassButton extends StatelessWidget {
  const GlassButton({super.key});

  @override
  Widget build(BuildContext context) => GlassContainer(
    alpha: 0.3,
    child: Padding(padding: EdgeInsets.all(6.r), child: Assets.icons.arrow45.svg()),
  );
}
