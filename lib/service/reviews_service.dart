import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_collection/model/review.dart';

class ReviewService {
  final db = FirebaseFirestore.instance;
  final _collection = "reviews";
  List<Review> reviews = [];
  ReviewService() {
    // 初期化処理あれば
  }

  Future<List<Review>> getReviews({required String movieId}) async {
    final snapShots = await db
        .collection(_collection)
        .where(
          "movieId",
          isEqualTo: movieId,
        )
        .get();
    List<Review> result = [];
    for (final doc in snapShots.docs) {
      Review data = Review.fromJson(doc.data());
      result.add(Review.fromJson(data.copyWith(docId: doc.id).toJson()));
    }
    result.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return result;
  }

  Future<String> addReviews({required Review review}) async {
    final result = await db.collection(_collection).add(
          review.toJson(),
        );
    return result.id;
  }

  Future<void> setReviews({required Review review}) async {
    await db.collection(_collection).doc(review.docId).set(
          review.toJson(),
        );
  }
}
