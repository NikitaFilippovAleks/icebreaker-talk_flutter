import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/gen/assets.gen.dart';
import '../../../../../shared/widgets/buttons/glass.dart';

part 'control_button.dart';

class CollectionControls extends StatelessWidget {
  const CollectionControls({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 16.w,
    children: const [
      ControlButton(variant: ControlButtonVariant.left),
      ControlButton(variant: ControlButtonVariant.right),
    ],
  );
}
