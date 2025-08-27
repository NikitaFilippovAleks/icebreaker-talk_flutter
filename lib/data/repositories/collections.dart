import 'package:injectable/injectable.dart';

import '../models/collection.dart';
import '../services/api/collections.dart';

@injectable
class CollectionsRepo {
  final CollectionsApi _collectionsApi;

  CollectionsRepo(this._collectionsApi);

  Future<List<Collection>> getCollections() async {
    final response = await _collectionsApi.getCollections();
    return response.data;
  }
}
