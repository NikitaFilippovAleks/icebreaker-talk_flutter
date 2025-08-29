import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/gen/assets.gen.dart';
import '../../../../../shared/widgets/animated_appearance.dart';
import '../../../../../shared/widgets/buttons/glass.dart';
import '../controller/bloc.dart';

part 'control_button.dart';

class CollectionControls extends StatelessWidget {
  const CollectionControls({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 16.w,
    children: const [
      AnimatedAppearance(
        appearanceDelay: Duration(milliseconds: 600),
        child: ControlButton(variant: ControlButtonVariant.left),
      ),
      AnimatedAppearance(
        appearanceDelay: Duration(milliseconds: 900),
        child: ControlButton(variant: ControlButtonVariant.right),
      ),
    ],
  );
}
