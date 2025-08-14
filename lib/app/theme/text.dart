import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle get _baseStyleInter => TextStyle(fontFamily: 'Inter', fontSize: 14.sp);

  static TextStyle get labelLarge => _baseStyleInter.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w500);
  static TextStyle get labelMedium => _baseStyleInter.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500);
}
