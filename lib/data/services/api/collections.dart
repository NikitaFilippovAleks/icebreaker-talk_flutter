import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../app/api/base_response.dart';
import '../../models/collection.dart';

part 'collections.g.dart';

@RestApi()
@injectable
abstract class CollectionsApi {
  @factoryMethod
  factory CollectionsApi(Dio dio) => _CollectionsApi(dio);

  @GET('/api/collections')
  Future<BaseResponse<List<Collection>>> getCollections({@Query('populate') String populate = '*'});
}
