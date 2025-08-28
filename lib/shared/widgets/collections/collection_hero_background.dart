import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionHeroBackground extends StatelessWidget {
  const CollectionHeroBackground({
    super.key,
    required this.id,
    required this.child,
    this.isFullScreen = false,
  });

  final int id;
  final Widget child;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) => Hero(
    tag: 'collection_background_$id',
    child: Container(
      decoration: BoxDecoration(
        color: Colors.pink[500],
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://images.contentstack.io/v3/assets/bltcedd8dbd5891265b/bltb0fc8c3edd349106/6668df63a62e8d63e6e051b2/beautiful-flowers-dahlia.jpg?q=70&width=3840&auto=webp',
          ),
        ),
        borderRadius: isFullScreen ? null : BorderRadius.circular(24.r),
      ),
      padding: isFullScreen ? null : EdgeInsets.all(4.r),
      child: child,
    ),
  );
}
