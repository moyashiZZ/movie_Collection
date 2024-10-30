import 'package:movie_collection/model/trend_movie_response.dart';
import 'package:movie_collection/service/movie_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_view_model.g.dart';

@riverpod
class TopViewModel extends _$TopViewModel {
  late MovieService _movieService;
  List<Movie> trendMovieResult = [];

  @override
  void build() async {
    _movieService = MovieService();
  }

  updateTrendPlaying() async {
    await _movieService.getTrendPlaying().then((result) {
      trendMovieResult = result;
    });
  }

  Future<List<Movie>> getTrendPlaying() {
    return _movieService.getTrendPlaying();
  }
}
