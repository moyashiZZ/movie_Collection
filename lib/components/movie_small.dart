import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_collection/model/trend_movie_response.dart';
import 'package:movie_collection/page/movie_detail.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../const.dart';

class MovieSmall extends StatelessWidget {
  const MovieSmall({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetail(
                movie: movie,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Image.network(
                    Const.imagePath + movie.poster_path,
                    loadingBuilder:
                        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // 画像がロードされたら表示
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        ); // 画像が読み込まれている間はスピナーを表示
                      }
                    },
                  ),
                  AutoSizeText(
                    movie.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    movie.release_date,
                    style: TextStyle(
                      color: CupertinoColors.inactiveGray.color,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: -50,
              child: Transform.scale(
                scale: 0.5,
                child: Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircularPercentIndicator(
                    radius: 100,
                    lineWidth: 10,
                    percent: movie.vote_average / 10,
                    center: Text(
                      "${(movie.vote_average * 10).toStringAsFixed(0)}%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
