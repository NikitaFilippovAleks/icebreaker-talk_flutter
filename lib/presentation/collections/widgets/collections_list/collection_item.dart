part of 'index.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({super.key, required this.collection, required this.color});
  final Collection collection;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme;
    final t = context.t;

    return GestureDetector(
      onTap: () => CollectionRoute(id: collection.id).go(context),
      child: CollectionHeroBackground(
        id: collection.id,
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
                            t.collections.questions_count(n: collection.questions.length),
                            style: theme.bodyMediumMontserrat.copyWith(color: theme.white),
                          ),
                        ),
                        ButtonsGlass(
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
      ),
    );
  }
}
