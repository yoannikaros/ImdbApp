import 'dart:convert';
import 'package:films/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:films/model/MovieDetailModel.dart';

class MovieApi {
  Future<Movie> fetchMovie(String id) async {
    final response = await http.get(Uri.parse('$baseURL/title/$id'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final movie = Movie(
        id: data['id'],
        reviewApiPath: data['review_api_path'],
        imdb: data['imdb'],
        contentType: data['contentType'],
        title: data['title'],
        image: data['image'],
        plot: data['plot'],
        genre: List<String>.from(data['genre']),
        actors: List<String>.from(data['actors']),
      );

      return movie;
    } else {
      throw Exception('Failed to fetch movie details');
    }
  }
}
