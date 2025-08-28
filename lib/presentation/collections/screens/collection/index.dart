import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/di/injector_configurator.dart';
import '../../../../app/theme/theme.dart';
import '../../../../shared/widgets/collections/collection_hero_background.dart';
import '../../../../shared/widgets/glass_card.dart';
import 'controller/bloc.dart';
import 'controls/index.dart';
import 'header.dart';

part 'body.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key, required this.id});

  final int id;

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: CollectionHeroBackground(
      id: widget.id,
      child: BlocProvider(
        create: (context) => getIt<CollectionBloc>(),
        child: CollectionBody(id: widget.id),
      ),
    ),
  );
}
