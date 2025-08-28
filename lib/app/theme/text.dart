import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle get _baseStyleManrope => TextStyle(fontFamily: 'Manrope', fontSize: 14.sp);
  static TextStyle get _baseStyleMontserrat =>
      TextStyle(fontFamily: 'Montserrat', fontSize: 14.sp, height: 1.2);

  static TextStyle get bodyMediumManrope =>
      _baseStyleManrope.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500);

  static TextStyle get labelLargeMontserrat =>
      _baseStyleMontserrat.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w500);
  static TextStyle get labelMediumMontserrat =>
      _baseStyleMontserrat.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500);
  static TextStyle get bodyMediumMontserrat =>
      _baseStyleMontserrat.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500);
}
