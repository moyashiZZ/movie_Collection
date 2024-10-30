import 'package:movie_collection/model/movie_detail_response.dart';
import 'package:movie_collection/model/review.dart';
import 'package:movie_collection/service/reviews_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_list_view_model.g.dart';

@riverpod
class ReviewListViewModel extends _$ReviewListViewModel {
  final ReviewService _reviewService = ReviewService();

  var movieDetail = MovieDetailResponse();
  @override
  void build() {
    //初期化必要であれば
  }

  Future<List<Review>> getReviews({required String movieId}) {
    return _reviewService.getReviews(movieId: movieId);
  }
}
