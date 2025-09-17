import 'package:flutter/material.dart';

extension HexColorExtension on String {
  Color toColor() {
    String hex = replaceAll('#', '').toUpperCase();

    if (hex.length == 6) {
      hex = 'FF$hex'; // добавляем альфа, если нет
    } else if (hex.length == 3) {
      // #RGB → #RRGGBB
      hex = hex.split('').map((c) => '$c$c').join();
      hex = 'FF$hex';
    }

    return Color(int.parse(hex, radix: 16));
  }
}
