import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'colors.dart';
import 'text.dart';

part 'theme.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class CustomTheme extends ThemeExtension<CustomTheme> with _$CustomThemeTailorMixin {
  CustomTheme({
    required this.background,
    required this.black,
    required this.loader1Left,
    required this.loader1Right,
    required this.loader2Left,
    required this.loader2Right,
    required this.text,
    required this.mint,
    required this.orangeDim,
    required this.white,
    required this.labelLargeMontserrat,
    required this.labelMediumMontserrat,
    required this.bodyMediumMontserrat,
    required this.bodyMediumManrope,
  });

  @override
  final Color background;
  @override
  final Color black;
  @override
  final Color loader1Left;
  @override
  final Color loader1Right;
  @override
  final Color loader2Left;
  @override
  final Color loader2Right;
  @override
  final Color text;
  @override
  final Color mint;
  @override
  final Color orangeDim;
  @override
  final Color white;
  @override
  final TextStyle labelLargeMontserrat;
  @override
  final TextStyle labelMediumMontserrat;
  @override
  final TextStyle bodyMediumMontserrat;
  @override
  final TextStyle bodyMediumManrope;
}

final lightSimpleTheme = CustomTheme(
  background: AppColors.background,
  black: AppColors.black,
  mint: AppColors.mint,
  loader1Left: AppColors.loader1Left,
  loader1Right: AppColors.loader1Right,
  loader2Left: AppColors.loader2Left,
  loader2Right: AppColors.loader2Right,
  text: AppColors.text,
  orangeDim: AppColors.orangeDim,
  white: AppColors.white,
  labelLargeMontserrat: AppTextStyles.labelLargeMontserrat.copyWith(color: AppColors.text),
  labelMediumMontserrat: AppTextStyles.labelMediumMontserrat.copyWith(color: AppColors.text),
  bodyMediumMontserrat: AppTextStyles.bodyMediumMontserrat.copyWith(color: AppColors.text),
  bodyMediumManrope: AppTextStyles.bodyMediumManrope.copyWith(color: AppColors.text),
);

final darkSimpleTheme = CustomTheme(
  background: Colors.black,
  black: AppColors.black,
  mint: AppColors.mint,
  loader1Left: AppColors.loader1Left,
  loader1Right: AppColors.loader1Right,
  loader2Left: AppColors.loader2Left,
  loader2Right: AppColors.loader2Right,
  text: AppColors.text,
  orangeDim: Colors.pink[100]!,
  white: AppColors.white,
  labelLargeMontserrat: AppTextStyles.labelLargeMontserrat.copyWith(color: AppColors.text),
  labelMediumMontserrat: AppTextStyles.labelMediumMontserrat.copyWith(color: AppColors.text),
  bodyMediumMontserrat: AppTextStyles.bodyMediumMontserrat.copyWith(color: AppColors.text),
  bodyMediumManrope: AppTextStyles.bodyMediumManrope.copyWith(color: AppColors.text),
);
