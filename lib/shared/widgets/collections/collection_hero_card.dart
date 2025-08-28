import 'package:flutter/material.dart';

import '../glass_card.dart';

class CollectionHeroCard extends StatelessWidget {
  const CollectionHeroCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => GlassCard(child: child);
}
