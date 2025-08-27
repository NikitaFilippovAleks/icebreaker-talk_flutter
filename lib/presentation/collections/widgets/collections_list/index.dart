import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/collection.dart';
import '../../../../shared/widgets/glass_card.dart';
import 'controller/bloc.dart';

part 'collection_item.dart';

class CollectionsList extends StatefulWidget {
  const CollectionsList({super.key});

  @override
  State<CollectionsList> createState() => _CollectionsListState();
}

class _CollectionsListState extends State<CollectionsList> {
  @override
  void initState() {
    super.initState();
    context.read<CollectionsListBloc>().add(const CollectionsListEvent.getCollections());
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<CollectionsListBloc, CollectionsListState>(
    builder: (context, state) => switch (state.fetchStatus) {
      CollectionsFetchStatus.initial => const Text('Get Collections'),
      CollectionsFetchStatus.success => ListView.builder(
        itemCount: state.collections.length,
        itemBuilder: (context, index) => CollectionItem(collection: state.collections[index]),
      ),
      CollectionsFetchStatus.failure => const Text('Failed to fetch collections'),
    },
  );
}
