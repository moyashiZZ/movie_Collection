import 'package:flutter/material.dart';
import 'package:movie_collection/model/user.dart';
import 'package:movie_collection/view_model/setting_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final viewModel = SettingViewModel();
  late SharedPreferences prefs;
  var uid = "";

  @override
  void initState() {
    super.initState();
  }

  _SettingState() {
    SharedPreferences.getInstance().then((pref) {
      prefs = pref;
      viewModel.getUser(uid: prefs.get("uid").toString()).then((user) {
        uid = user.uid;
        _nameController.text = user.name;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  String? _validateInput(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      final user = User(
        uid: prefs.get("uid").toString(),
        name: name,
      );
      if (uid.isEmpty) {
        viewModel.addUser(user: user).then((result) {
          if (result.isNotEmpty) {
            toastification.show(
              context: context,
              title: Text('変更完了'),
              autoCloseDuration: const Duration(seconds: 5),
            );
          } else {
            toastification.show(
              context: context,
              title: Text('ERROR'),
              autoCloseDuration: const Duration(seconds: 5),
            );
          }
        });
      } else {
        viewModel.setUser(user: user).then((result) {
          toastification.show(
            context: context,
            title: Text('変更完了'),
            autoCloseDuration: const Duration(seconds: 5),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700,
        width: 400,
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'ニックネーム',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _validateInput(value, "ニックネーム"),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('送信'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
