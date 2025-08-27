part of 'index.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({super.key, required this.collection});
  final Collection collection;

  @override
  Widget build(BuildContext context) => Container(
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
                Text(collection.name),
                Text(collection.description),
                Row(children: [Container(child: const Text('30 вопросов'))]),
              ],
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    ),
  );
}
