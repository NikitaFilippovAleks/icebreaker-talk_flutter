import 'package:flutter/material.dart';

import '../../../app/gen/assets.gen.dart';
import 'glass.dart';

class ButtonsBack extends StatelessWidget {
  const ButtonsBack({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => ButtonsGlass(
    onPressed: onPressed,
    variant: ButtonsGlassVariant.square,
    child: Assets.icons.arrowLeft.svg(),
  );
}
