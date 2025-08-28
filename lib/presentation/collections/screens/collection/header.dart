import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/theme.dart';
import '../../../../shared/widgets/buttons/back.dart';

class CollectionHeader extends StatelessWidget {
  const CollectionHeader({
    super.key,
    required this.questionsCount,
    required this.currentQuestionNumber,
  });
  final int questionsCount;
  final int currentQuestionNumber;

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonsBack(onPressed: () => context.pop()),
        Container(
          decoration: BoxDecoration(
            color: context.customTheme.black,
            borderRadius: BorderRadius.circular(100.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          child: Text(
            '$currentQuestionNumber / $questionsCount',
            style: theme.bodyMediumMontserrat.copyWith(color: theme.white),
          ),
        ),
        SizedBox(width: 36.w),
      ],
    );
  }
}
