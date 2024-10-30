import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_collection/page/review_input.dart';
import 'package:movie_collection/view_model/review_detail_view_model.dart';

import '../model/review.dart';
import '../util.dart';

class ReviewDetail extends StatefulWidget {
  const ReviewDetail({
    super.key,
    required this.review,
  });

  final Review review;
  @override
  State<StatefulWidget> createState() => _ReviewDetailState();
}

class _ReviewDetailState extends State<ReviewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Consumer(builder: (context, ref, _) {
                final notifier = ref.watch(reviewDetailViewModelProvider.notifier);
                return FutureBuilder(
                  future: notifier.isMyReview(
                    reviewUid: widget.review.uid,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator()); // 読み込み中のインジケーターを表示
                    } else if (snapshot.hasError) {
                      return Text('エラー: ${snapshot.error}'); // エラー状態を処理
                    } else if (snapshot.hasData) {
                      return Visibility(
                        visible: notifier.uid == widget.review.uid,
                        child: Container(
                          margin: EdgeInsets.all(16),
                          child: ElevatedButton(
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
                                    movieId: widget.review.movieId,
                                    review: widget.review,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              '編集',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Text('データは利用できません'); // データがない場合を処理
                    }
                  },
                );
              }),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(
                    color: Colors.black26,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              widget.review.name[0],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            softWrap: true,
                            widget.review.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(widget.review.name),
                          Text(
                            Util.formatDateTime(
                              dateTime: Util.timestampToDateTime(
                                timestamp: widget.review.dateTime,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                    width: 1,
                  ),
                ),
                child: Text(widget.review.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
