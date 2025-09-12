import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/gen/assets.gen.dart';
import '../../../../app/i18n/strings.g.dart';
import '../../../../app/router/routes/index.dart';
import '../../../../app/theme/theme.dart';
import '../../../../data/models/collection.dart';
import '../../../../shared/widgets/buttons/glass.dart';
import '../../../../shared/widgets/collections/collection_hero_background.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../app/controller/bloc.dart';

part 'collection_item.dart';

class CollectionsList extends StatelessWidget {
  const CollectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme;

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) => ListView.separated(
        itemCount: state.collections.length,
        separatorBuilder: (context, index) => SizedBox(height: 4.h),
        itemBuilder: (context, index) => CollectionItem(
          collection: state.collections[index],
          color: index.isEven ? theme.mint : theme.black,
        ),
      ),
    );
  }
}
