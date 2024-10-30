import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'review_detail_view_model.g.dart';

@riverpod
class ReviewDetailViewModel extends _$ReviewDetailViewModel {
  bool isMine = false;
  String uid = "";
  @override
  void build() async {
    final pref = await SharedPreferences.getInstance();
    uid = pref.get("uid").toString();
  }

  Future<bool> isMyReview({required String reviewUid}) async {
    final pref = await SharedPreferences.getInstance();
    final uId = pref.get("uid");
    return uId == reviewUid;
  }
}
