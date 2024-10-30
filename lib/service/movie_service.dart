import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_collection/model/credits_response.dart';
import 'package:movie_collection/model/movie_detail_response.dart';
import 'package:movie_collection/service/base_service.dart';

import '../model/trend_movie_response.dart';

class MovieService extends BaseService {
  Future<List<Movie>> getTrendPlaying() async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}now_playing?region=JP&page=1&api_key=$apiKey&language=ja"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<Movie> movieList = [];

        for (var entry in data['results']) {
          movieList.add(Movie.fromJson(entry));
        }

        return movieList;
      } else {
        throw Exception('Failed to load users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server. Error: $e');
    }
  }

  Future<MovieDetailResponse> getMovieDetail({required String movieId}) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl$movieId?language=ja&api_key=$apiKey"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        MovieDetailResponse movieDetail = MovieDetailResponse();
        movieDetail = MovieDetailResponse.fromJson(data);
        return movieDetail;
      } else {
        throw Exception('Failed to load users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server. Error: $e');
    }
  }

  Future<CreditsResponse> getCredits({required String movieId}) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl$movieId/credits?language=ja&api_key=$apiKey"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        CreditsResponse creditsResponse = CreditsResponse();
        creditsResponse = CreditsResponse.fromJson(data);
        return creditsResponse;
      } else {
        throw Exception('Failed to load users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server. Error: $e');
    }
  }
}
