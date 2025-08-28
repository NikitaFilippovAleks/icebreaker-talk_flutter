import 'package:flutter/material.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Collection $id')));
}
