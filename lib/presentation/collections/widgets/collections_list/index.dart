import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/gen/assets.gen.dart';
import '../../../../app/i18n/strings.g.dart';
import '../../../../app/router/routes/index.dart';
import '../../../../app/theme/theme.dart';
import '../../../../data/models/collection/collection.dart';
import '../../../../shared/widgets/buttons/glass.dart';
import '../../../../shared/widgets/collections/collection_hero_background.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/pull_refresh/index.dart';
import '../../../app/controller/bloc.dart';

part 'collection_item.dart';

class CollectionsList extends StatefulWidget {
  const CollectionsList({super.key});

  @override
  State<CollectionsList> createState() => _CollectionsListState();
}

class _CollectionsListState extends State<CollectionsList> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _opacity = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme;

    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) => PullRefresh(
          onRefresh: () {
            final completer = Completer<void>();
            context.read<AppBloc>().add(AppEvent.refresh(completer));
            return completer.future;
          },
          child: ListView.separated(
            itemCount: state.collections.length,
            separatorBuilder: (context, index) => SizedBox(height: 4.h),
            itemBuilder: (context, index) => CollectionItem(
              collection: state.collections[index],
              color: index.isEven ? theme.mint : theme.black,
              isReversed: index.isOdd ? true : false,
            ),
          ),
        ),
      ),
    );
  }
}
