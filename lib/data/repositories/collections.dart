import 'package:injectable/injectable.dart';

import '../models/collection.dart';
import '../services/api/collections.dart';
import '../services/local/collections.dart';

@injectable
class CollectionsRepo {
  final CollectionsApi _collectionsApi;
  final CollectionsLocal _collectionsLocal;

  CollectionsRepo(this._collectionsApi, this._collectionsLocal);

  Future<List<Collection>> getCollections() async {
    if (_collectionsLocal.collections.isNotEmpty) {
      return _collectionsLocal.collections;
    }

    final response = await _collectionsApi.getCollections();

    _collectionsLocal.setCollections(response.data);

    return _collectionsLocal.collections;
  }

  Future<Collection> getCollection(int id) async {
    final collection = _collectionsLocal.collections.firstWhere((element) => element.id == id);

    return collection;
  }
}
