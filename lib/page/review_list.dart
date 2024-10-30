import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_collection/components/simple_review.dart';
import 'package:movie_collection/page/review_input.dart';
import 'package:movie_collection/view_model/review_list_view_model.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({
    super.key,
    required this.movieId,
  });

  final String movieId;
  @override
  State<StatefulWidget> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewInput(
                      movieId: widget.movieId,
                    ),
                  ),
                );
              },
              child: const Text(
                'レビューを書く',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Consumer(
                builder: (context, ref, child) {
                  final reviewListNotifier = ref.watch(reviewListViewModelProvider.notifier);
                  return FutureBuilder(
                    future: reviewListNotifier.getReviews(movieId: widget.movieId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator()); // 読み込み中のインジケーターを表示
                      } else if (snapshot.hasError) {
                        return Text('エラー: ${snapshot.error}'); // エラー状態を処理
                      } else if (snapshot.hasData) {
                        final reviews = snapshot.requireData;
                        return SizedBox(
                          height: 500,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: reviews.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SimpleReview(review: reviews[index]),
                                );
                              }),
                        );
                      } else {
                        return Text('データは利用できません'); // データがない場合を処理
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
