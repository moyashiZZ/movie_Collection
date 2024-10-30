import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_collection/components/movie_small.dart';
import 'package:movie_collection/model/trend_movie_response.dart';

class TrendMovieList extends StatefulWidget {
  TrendMovieList({
    super.key,
    required this.trendMovies,
  });

  List<Movie> trendMovies;

  @override
  State<TrendMovieList> createState() => _TrendMovieListState();
}

class _TrendMovieListState extends State<TrendMovieList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Consumer(
        builder: (context, ref, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.trendMovies.length,
            itemBuilder: (context, index) {
              return MovieSmall(
                movie: widget.trendMovies[index],
              );
            },
          );
        },
      ),
    );
  }
}
