part of 'index.dart';

class CollectionBody extends StatefulWidget {
  const CollectionBody({super.key, required this.id});

  final int id;

  @override
  State<CollectionBody> createState() => _CollectionBodyState();
}

class _CollectionBodyState extends State<CollectionBody> {
  @override
  void initState() {
    super.initState();
    context.read<CollectionBloc>().add(CollectionEvent.getCollection(widget.id));
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<CollectionBloc, CollectionState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CollectionHeader(),
              SizedBox(height: 50.h),
              if (state.collection != null) const Expanded(child: Cards()),
              SizedBox(height: 58.h),
            ],
          ),
        ),
      ),
    ),
  );
}
