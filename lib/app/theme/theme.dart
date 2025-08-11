import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'colors.dart';
import 'text.dart';

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
  labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.text),
  labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.text),
);

final darkSimpleTheme = CustomTheme(
  background: Colors.black,
  text: AppColors.text,
  orangeDim: Colors.pink[100]!,
  labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.text),
  labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.text),
);
