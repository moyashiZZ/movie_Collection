import 'package:movie_collection/model/credits_response.dart';
import 'package:movie_collection/model/movie_detail_response.dart';
import 'package:movie_collection/service/movie_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_detail_view_model.g.dart';

@riverpod
class MovieDetailViewModel extends _$MovieDetailViewModel {
  late MovieService _movieService;

  var movieDetail = MovieDetailResponse();
  @override
  void build() {
    _movieService = MovieService();
  }

  Future<MovieDetailResponse> getMovieDetail({required String movieId}) {
    return _movieService.getMovieDetail(movieId: movieId);
  }

  Future<CreditsResponse> getCredits({required String movieId}) {
    return _movieService.getCredits(movieId: movieId);
  }
}
