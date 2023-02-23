import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:films/utils/constants.dart';
import 'package:films/model/MovieModel.dart';

class MovieViewModel {
  static const String API_URL = '$baseURL/search?query=';

  Future<List<Movie>> fetchMovies(String query) async {
    final response = await http.get(Uri.parse(API_URL + query));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List;
      List<Movie> movies =
          results.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
