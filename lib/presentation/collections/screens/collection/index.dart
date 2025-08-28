import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/theme.dart';
import '../../../../shared/widgets/collections/collection_hero_background.dart';
import '../../../../shared/widgets/glass_card.dart';
import 'controls/index.dart';
import 'header.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme;

    return Scaffold(
      body: CollectionHeroBackground(
        id: id,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CollectionHeader(questionsCount: 10, currentQuestionNumber: 1),
                  SizedBox(height: 50.h),
                  Expanded(
                    child: GlassCard(
                      alpha: 0.3,
                      child: Center(
                        child: Text(
                          'Как ты реагируешь на негативную обратную свзязь?',
                          style: theme.labelLargeMontserrat,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const CollectionControls(),
                  SizedBox(height: 58.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
