import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection.g.dart';
part 'collection.freezed.dart';

@freezed
abstract class Collection with _$Collection {
  // ignore: invalid_annotation_target
  @JsonSerializable()
  const factory Collection({
    required int id,
    required String name,
    required String description,
    required String color,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}
