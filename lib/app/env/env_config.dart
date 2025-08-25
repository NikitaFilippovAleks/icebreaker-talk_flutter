import 'package:freezed_annotation/freezed_annotation.dart';

part 'env_config.freezed.dart';
part 'env_config.g.dart';

@freezed
abstract class EnvConfig with _$EnvConfig {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory EnvConfig({required String apiUrl}) = _EnvConfig;

  factory EnvConfig.fromJson(Map<String, dynamic> json) => _$EnvConfigFromJson(json);
}
