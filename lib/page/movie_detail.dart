import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_collection/components/credits.dart';
import 'package:movie_collection/components/movie_large.dart';
import 'package:movie_collection/page/review_list.dart';
import 'package:movie_collection/view_model/movie_detail_view_model.dart';

import '../model/trend_movie_response.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<StatefulWidget> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final detailNotifier = ref.watch(movieDetailViewModelProvider.notifier);
                  return FutureBuilder(
                    future: detailNotifier.getMovieDetail(
                      movieId: widget.movie.id.toString(),
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator()); // 読み込み中のインジケーターを表示
                      } else if (snapshot.hasError) {
                        return Text('エラー: ${snapshot.error}'); // エラー状態を処理
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            MovieLarge(
                              movieDetail: snapshot.requireData,
                            ),
                          ],
                        ); // データでウィジェットを返す
                      } else {
                        return Text('データは利用できません'); // データがない場合を処理
                      }
                    },
                  );
                },
              ),
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
                      builder: (context) => ReviewList(
                        movieId: widget.movie.id.toString(),
                      ),
                    ),
                  );
                },
                child: const Text(
                  'レビューを見る',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    final detailNotifier = ref.watch(movieDetailViewModelProvider.notifier);
                    return FutureBuilder(
                      future: detailNotifier.getCredits(
                        movieId: widget.movie.id.toString(),
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator()); // 読み込み中のインジケーターを表示
                        } else if (snapshot.hasError) {
                          return Text('エラー: ${snapshot.error}'); // エラー状態を処理
                        } else if (snapshot.hasData) {
                          return Credits(credits: snapshot.requireData); // データでウィジェットを返す
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
      ),
    );
  }
}
