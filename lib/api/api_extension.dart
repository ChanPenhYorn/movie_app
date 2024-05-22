import 'dart:convert';

import 'package:flixkh/api/api.dart';
import 'package:flixkh/api/api_end_point.dart';
import 'package:flixkh/constants/constant.dart';
import 'package:flixkh/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<MovieModel>> getTrendingMovies() async {
    final String url =
        '${Api.baseUrl}${ApiEndPoint.trendingMovies}${Constants.apiKey}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<MovieModel> trendingMovieList = (data['results'] as List)
            .map((json) => MovieModel.fromJson(json))
            .toList();

        return trendingMovieList;
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      throw Exception('Failed to load trending movies: $e');
    }
  }
}
