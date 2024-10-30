import 'package:movie_collection/service/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user.dart';

part 'setting_view_model.g.dart';

@riverpod
class SettingViewModel extends _$SettingViewModel {
  final UserService _userService = UserService();

  @override
  void build() {
    //初期化必要であれば
  }

  Future<String> addUser({required User user}) {
    return _userService.addUser(user: user);
  }

  Future<User> getUser({required String uid}) {
    return _userService.getUser(uid: uid);
  }

  Future<void> setUser({required User user}) {
    return _userService.setUser(user: user);
  }
}
