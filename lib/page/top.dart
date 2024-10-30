import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_collection/components/trend_movie_list.dart';
import 'package:movie_collection/view_model/top_view_model.dart';

class Top extends StatefulWidget {
  const Top({super.key});

  @override
  State<StatefulWidget> createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final topNotifier = ref.watch(topViewModelProvider.notifier);
                  return FutureBuilder(
                    future: topNotifier.getTrendPlaying(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // 読み込み中のインジケーターを表示
                      } else if (snapshot.hasError) {
                        return Text('エラー: ${snapshot.error}'); // エラー状態を処理
                      } else if (snapshot.hasData) {
                        return TrendMovieList(trendMovies: snapshot.requireData); // データでウィジェットを返す
                      } else {
                        return Text('データは利用できません'); // データがない場合を処理
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
