import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/logo/full_logo.dart';
import '../../collections/widgets/collections_list/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
            child: const FullLogo(),
          ),
          const Expanded(child: CollectionsList()),
        ],
      ),
    ),
  );
}
