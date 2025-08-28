import 'package:injectable/injectable.dart';

import '../../models/collection.dart';

@lazySingleton
class CollectionsLocal {
  final _collections = <Collection>[];

  List<Collection> get collections => _collections;

  void setCollections(List<Collection> collections) {
    _collections.addAll(collections);
  }
}
