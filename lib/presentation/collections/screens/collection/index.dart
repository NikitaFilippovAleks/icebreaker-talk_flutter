import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injector_configurator.dart';
import '../../../../app/theme/theme.dart';
import '../../../../shared/widgets/animated_appearance.dart';
import '../../../../shared/widgets/buttons/back.dart';
import '../../../../shared/widgets/collections/collection_hero_background.dart';
import '../../../../shared/widgets/glass_card.dart';
import 'appearance_controller.dart';
import 'controller/bloc.dart';
import 'controls/index.dart';

part 'body.dart';
part 'cards.dart';
part 'header.dart';
part 'question_card.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key, required this.id});

  final int id;

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  bool isShowContent = false;
  late StreamSubscription<bool> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = CollectionAppearanceController().animationStream.listen((canAnimate) {
      if (mounted && canAnimate) {
        setState(() => isShowContent = true);
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: CollectionHeroBackground(
      isFullScreen: true,
      id: widget.id,
      child: BlocProvider(
        create: (context) => getIt<CollectionBloc>(),
        child: isShowContent
            ? CollectionBody(id: widget.id)
            : const SizedBox(width: double.infinity, height: double.infinity),
      ),
    ),
  );
}
