import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "このアプリについて",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text("話題になっている映画情報の閲覧・レビューの投稿が出来ます。"),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8.0),
            child: Text(
              "使用技術",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text("このアプリは主に以下の技術を使用しています。"),
          Text("・Flutter"),
          Text("・Flutter Riverpod"),
          Text("・Riverpod Generator"),
          Text("・Cloud Firestore"),
          Text("・Firebase Auth"),
          Text("・Freezed"),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8.0),
            child: Text(
              "データ取得元",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text("The Movie Database"),
          Text("https://www.themoviedb.org/"),
        ],
      ),
    );
  }
}
