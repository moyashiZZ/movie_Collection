import 'package:freezed_annotation/freezed_annotation.dart';

part 'credits_response.freezed.dart';
part 'credits_response.g.dart';

@freezed
class CreditsResponse with _$CreditsResponse {
  const factory CreditsResponse({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'cast') @Default([]) List<Cast> cast,
    @JsonKey(name: 'crew') @Default([]) List<Crew> crew,
  }) = _CreditsResponse;

  factory CreditsResponse.fromJson(Map<String, dynamic> json) => _$CreditsResponseFromJson(json);
}

@freezed
class Cast with _$Cast {
  const factory Cast({
    @JsonKey(name: 'adult') @Default(false) bool adult,
    @JsonKey(name: 'gender') @Default(0) int gender,
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'known_for_department') @Default('') String knownForDepartment,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'original_name') @Default('') String originalName,
    @JsonKey(name: 'popularity') @Default(0.0) double popularity,
    @JsonKey(name: 'profile_path') @Default('') String profilePath,
    @JsonKey(name: 'cast_id') @Default(0) int castId,
    @JsonKey(name: 'character') @Default('') String character,
    @JsonKey(name: 'credit_id') @Default('') String creditId,
    @JsonKey(name: 'order') @Default(0) int order,
  }) = _Cast;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}

@freezed
class Crew with _$Crew {
  const factory Crew({
    @JsonKey(name: 'adult') @Default(false) bool adult,
    @JsonKey(name: 'gender') @Default(0) int gender,
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'known_for_department') @Default('') String knownForDepartment,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'original_name') @Default('') String originalName,
    @JsonKey(name: 'popularity') @Default(0.0) double popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(name: 'credit_id') @Default('') String creditId,
    @JsonKey(name: 'department') @Default('') String department,
    @JsonKey(name: 'job') @Default('') String job,
  }) = _Crew;

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
}
