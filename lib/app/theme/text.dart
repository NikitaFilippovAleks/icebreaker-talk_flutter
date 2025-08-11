import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle get _baseStyleInter => TextStyle(fontFamily: 'Inter', fontSize: 14.r);

  static TextStyle get labelLarge => _baseStyleInter.copyWith(fontSize: 20.r, fontWeight: FontWeight.w500);
  static TextStyle get labelMedium => _baseStyleInter.copyWith(fontSize: 16.r, fontWeight: FontWeight.w500);
}
