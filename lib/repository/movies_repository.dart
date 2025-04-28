import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/movie_model.dart';

class MoviesRepository {
  Future<List<MovieModel>> fetchMovieData() async {
    var url = 'https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies.json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<MovieModel> movieList;
      List<dynamic> jsonBody = jsonDecode(response.body);
      movieList = (jsonBody).map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
      return movieList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
