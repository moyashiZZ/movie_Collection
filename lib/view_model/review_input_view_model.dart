import 'package:movie_collection/model/movie_detail_response.dart';
import 'package:movie_collection/model/review.dart';
import 'package:movie_collection/service/reviews_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user.dart';
import '../service/user_service.dart';

part 'review_input_view_model.g.dart';

@riverpod
class ReviewInputViewModel extends _$ReviewInputViewModel {
  final ReviewService _reviewService = ReviewService();
  final UserService _userService = UserService();

  var movieDetail = MovieDetailResponse();
  @override
  void build() {
    //初期化必要であれば
  }

  Future<String> addReview({required Review review}) {
    return _reviewService.addReviews(review: review);
  }

  Future<void> setReview({required Review review}) async {
    await _reviewService.setReviews(review: review);
  }

  Future<User> getUser({required String uid}) {
    return _userService.getUser(uid: uid);
  }
}
