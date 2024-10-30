import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_collection/model/user.dart';

class UserService {
  final db = FirebaseFirestore.instance;
  final _collection = "users";
  User user = User();
  UserService() {
    // 初期化処理あれば
  }

  Future<User> getUser({required String uid}) async {
    final snapShots = await db
        .collection(_collection)
        .where(
          "uid",
          isEqualTo: uid,
        )
        .get();
    final doc = snapShots.docs.first;
    final result = User.fromJson(doc.data());
    return result;
  }

  Future<String> addUser({required User user}) async {
    final result = await db.collection(_collection).add(
          user.toJson(),
        );
    return result.id;
  }

  Future<void> setUser({required User user}) async {
    await db.collection(_collection).doc(user.uid).set(user.toJson());
  }
}
