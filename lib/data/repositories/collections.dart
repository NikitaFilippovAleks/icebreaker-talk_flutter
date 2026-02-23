import 'package:injectable/injectable.dart';

import '../models/collection/collection.dart';
import '../services/api/collections.dart';
import '../services/local/collections.dart';

@injectable
class CollectionsRepo {
  final CollectionsApi _collectionsApi;
  final CollectionsLocal _collectionsLocal;

  CollectionsRepo(this._collectionsApi, this._collectionsLocal);

  Future<List<Collection>> getCollections() async {
    // Сначала пытаемся загрузить из локальной базы данных
    final localCollections = await _collectionsLocal.getCollections();

    if (localCollections.isNotEmpty) {
      return localCollections;
    }

    // Если локально нет данных, загружаем с API
    final response = await _collectionsApi.getCollections();

    // Сохраняем в локальную базу данных
    await _collectionsLocal.saveCollections(response.data);

    return response.data;
  }

  Future<Collection> getCollection(int id) async {
    // Загружаем конкретную коллекцию с вопросами из базы данных
    return _collectionsLocal.getCollection(id);
  }
}
