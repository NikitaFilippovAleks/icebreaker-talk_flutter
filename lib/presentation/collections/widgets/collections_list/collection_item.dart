part of 'index.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({super.key, required this.collection, required this.color});
  final Collection collection;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[500],
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://images.contentstack.io/v3/assets/bltcedd8dbd5891265b/bltb0fc8c3edd349106/6668df63a62e8d63e6e051b2/beautiful-flowers-dahlia.jpg?q=70&width=3840&auto=webp',
          ),
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.all(4.r),
      child: Row(
        children: [
          Expanded(
            child: GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 25.h,
                children: [
                  Text(collection.name, style: theme.labelLargeMontserrat),
                  Text(collection.description, style: theme.bodyMediumManrope),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Text(
                          '${collection.questions.length} вопросов',
                          style: theme.bodyMediumMontserrat.copyWith(color: theme.white),
                        ),
                      ),
                      GlassButton(
                        child: Assets.icons.arrow45.svg(
                          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
