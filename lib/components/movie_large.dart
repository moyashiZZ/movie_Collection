import 'package:flutter/material.dart';
import 'package:image_to_color_palette/image_to_color_palette.dart';
import 'package:movie_collection/components/margin.dart';
import 'package:movie_collection/model/movie_detail_response.dart';
import 'package:movie_collection/util.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../const.dart';

class MovieLarge extends StatefulWidget {
  const MovieLarge({
    super.key,
    required this.movieDetail,
  });

  final MovieDetailResponse movieDetail;

  @override
  State<MovieLarge> createState() => _MovieLargeState();
}

class _MovieLargeState extends State<MovieLarge> {
  var themeColor = Colors.white;
  void getThemeColor() {
    final palette = Palette();
    palette
        .imagePalette(imageUrl: Const.imagePath + widget.movieDetail.backdropPath.toString())
        .then((colors) {
      themeColor = colors.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Visibility(
                visible: widget.movieDetail.backdropPath != null,
                child: Image.network(
                  Const.imagePath + widget.movieDetail.backdropPath.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.all(16),
                  height: 150,
                  child: Image.network(
                    Const.imagePath + widget.movieDetail.posterPath,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OverflowBar(
                  children: [
                    Text(
                      widget.movieDetail.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text("(${widget.movieDetail.releaseDate.substring(0, 4)})"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: CircularPercentIndicator(
                        radius: 30,
                        lineWidth: 8,
                        percent: widget.movieDetail.voteAverage / 10,
                        center: Text(
                          "${(widget.movieDetail.voteAverage * 10).toStringAsFixed(0)}%",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          "ユーザースコア",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Margin(margin: 8),
                Row(
                  children: [
                    Text(
                        "${Util.convertDateToJapaneseFormat(widget.movieDetail.releaseDate)}・${Util.convertMinutesToHoursAndMinutes(widget.movieDetail.runtime)}"),
                  ],
                ),
                Margin(margin: 8),
                Wrap(
                  children: [
                    for (final genre in widget.movieDetail.genres) Text("${genre.name} "),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.movieDetail.tagline == "",
                      child: Text(
                        widget.movieDetail.tagline,
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                    Visibility(
                      visible: widget.movieDetail.overview.isNotEmpty,
                      child: Text(
                        "概要",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Margin(margin: 8),
                    Text(widget.movieDetail.overview),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
