import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_response.freezed.dart';
part 'movie_detail_response.g.dart';

@freezed
class MovieDetailResponse with _$MovieDetailResponse {
  const factory MovieDetailResponse({
    @Default(false) bool adult,
    @JsonKey(name: 'backdrop_path') @Default('') String? backdropPath,
    @Default(0) int budget,
    @Default([]) List<Genre> genres,
    @Default('') String homepage,
    @Default(0) int id,
    @JsonKey(name: 'imdb_id') @Default('') String imdbId,
    @JsonKey(name: 'original_language') @Default('en') String originalLanguage,
    @JsonKey(name: 'original_title') @Default('') String originalTitle,
    @Default('') String overview,
    @Default(0.0) double popularity,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @JsonKey(name: 'production_companies') @Default([]) List<ProductionCompany> productionCompanies,
    @JsonKey(name: 'production_countries') @Default([]) List<ProductionCountry> productionCountries,
    @JsonKey(name: 'release_date') @Default('') String releaseDate,
    @Default(0) int revenue,
    @Default(0) int runtime,
    @JsonKey(name: 'spoken_languages') @Default([]) List<SpokenLanguage> spokenLanguages,
    @Default('') String status,
    @Default('') String tagline,
    @Default('') String title,
    @Default(false) bool video,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(0) int voteCount,
  }) = _MovieDetailResponse;

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    @Default(0) int id,
    @Default('') String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    @Default(0) int id,
    @JsonKey(name: 'logo_path') @Default('') String? logoPath,
    @Default('') String name,
    @JsonKey(name: 'origin_country') @Default('') String originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @JsonKey(name: 'iso_3166_1') @Default('') String iso31661,
    @Default('') String name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'english_name') @Default('') String englishName,
    @JsonKey(name: 'iso_639_1') @Default('') String iso6391,
    @Default('') String name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);
}
