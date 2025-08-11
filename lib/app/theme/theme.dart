import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'colors.dart';

part 'theme.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class CustomTheme extends ThemeExtension<CustomTheme> with _$CustomThemeTailorMixin {
  CustomTheme({
    required this.background,
    required this.text,
    required this.orangeDim,
    required this.labelLarge,
    required this.labelMedium,
  });

  static const labelLargeStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static const labelMediumStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  final Color background;
  @override
  final Color text;
  @override
  final Color orangeDim;
  @override
  final TextStyle labelLarge;
  @override
  final TextStyle labelMedium;
}

final lightSimpleTheme = CustomTheme(
  background: AppColors.background,
  text: AppColors.text,
  orangeDim: AppColors.orangeDim,
  labelLarge: CustomTheme.labelLargeStyle.copyWith(color: const Color.fromARGB(221, 25, 25, 25)),
  labelMedium: CustomTheme.labelMediumStyle.copyWith(color: Colors.amber.shade700),
);

final darkSimpleTheme = CustomTheme(
  background: Colors.black,
  text: AppColors.text,
  orangeDim: Colors.pink[100]!,
  labelLarge: CustomTheme.labelLargeStyle.copyWith(color: Colors.grey.shade200),
  labelMedium: CustomTheme.labelMediumStyle.copyWith(color: Colors.blueGrey.shade300),
);
