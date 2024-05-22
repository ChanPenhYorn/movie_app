import 'dart:convert';
import 'package:flixkh/api/api.dart';
import 'package:flixkh/api/api_end_point.dart';
import 'package:flixkh/constants/constant.dart';
import 'package:flixkh/constants/style_font.dart';
import 'package:flixkh/models/movie.dart';
import 'package:flixkh/widgets/movie_slide.dart';
import 'package:flixkh/widgets/trending_slide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> trendingMovieList = [];
  List<MovieModel> topRateMovieList = [];
  List<MovieModel> upcomingMovieList = [];

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

  Future<List<MovieModel>> getTopRateMovies() async {
    final String url =
        '${Api.baseUrl}${ApiEndPoint.topRateMovies}${Constants.apiKey}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<MovieModel> topRateMovieList = (data['results'] as List)
            .map((json) => MovieModel.fromJson(json))
            .toList();

        return topRateMovieList;
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      throw Exception('Failed to load trending movies: $e');
    }
  }

  Future<List<MovieModel>> getUpcommingMovies() async {
    final String url =
        '${Api.baseUrl}${ApiEndPoint.upcomingMovies}${Constants.apiKey}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<MovieModel> upcomingMovieList = (data['results'] as List)
            .map((json) => MovieModel.fromJson(json))
            .toList();

        return upcomingMovieList;
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      throw Exception('Failed to load trending movies: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getTrendingMovies();
    // trendingMovieList = Api().getTrendiingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            "assets/title_logo.png",
            fit: BoxFit.cover,
            height: 40,
            width: 250,
            filterQuality: FilterQuality.high,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ភាពយន្តពេញនិយម",
                  style: StyleFonts.kantumruyPro(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: FutureBuilder<List<MovieModel>>(
                    future: getTrendingMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No movies found'));
                      } else {
                        return TrendingSlide(
                          snapshot: snapshot,
                          lenght: snapshot.data!.length,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "ភាពយន្ត​កម្រិត​កំពូល",
                  style: StyleFonts.kantumruyPro(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: FutureBuilder<List<MovieModel>>(
                    future: getTopRateMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No movies found'));
                      } else {
                        return MovieSlide(
                            snapshot: snapshot, length: snapshot.data!.length);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "ភាពយន្តដែលនឹងមកដល់ឆាប់ៗនេះ",
                  style: StyleFonts.kantumruyPro(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: FutureBuilder<List<MovieModel>>(
                    future: getUpcommingMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No movies found'));
                      } else {
                        return MovieSlide(
                            snapshot: snapshot, length: snapshot.data!.length);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
