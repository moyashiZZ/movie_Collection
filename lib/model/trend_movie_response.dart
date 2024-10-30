import 'package:freezed_annotation/freezed_annotation.dart';

part 'trend_movie_response.freezed.dart';
part 'trend_movie_response.g.dart';

@freezed
class TrendMovieResponse with _$TrendMovieResponse {
  const factory TrendMovieResponse({
    @Default(Dates()) Dates dates, // デフォルトでDatesオブジェクトを設定
    @Default(0) int page, // デフォルト値0
    @Default(<Movie>[]) List<Movie> results, // 空のリストをデフォルト値として設定
  }) = _TrendMovieResponse;

  factory TrendMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendMovieResponseFromJson(json);
}

@freezed
class Dates with _$Dates {
  const factory Dates({
    @Default('') String maximum, // 空文字をデフォルト値として設定
    @Default('') String minimum, // 空文字をデフォルト値として設定
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@freezed
class Movie with _$Movie {
  const factory Movie({
    @Default(false) bool adult, // デフォルト値false
    @Default('') String backdrop_path, // 空文字
    @Default(<int>[]) List<int> genre_ids, // 空のリスト
    @Default(0) int id, // デフォルト値0
    @Default('') String original_language, // 空文字
    @Default('') String original_title, // 空文字
    @Default('') String overview, // 空文字
    @Default(0.0) double popularity, // デフォルト値0.0
    @Default('') String poster_path, // 空文字
    @Default('') String release_date, // 空文字
    @Default('') String title, // 空文字
    @Default(false) bool video, // デフォルト値false
    @Default(0.0) double vote_average, // デフォルト値0.0
    @Default(0) int vote_count, // デフォルト値0
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
