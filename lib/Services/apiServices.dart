import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:move_app/models/moveModel.dart';

class ApiService {
  final apiKey = "api_key=458c3a67df7e974071a0d059bcdc296d";
  final popularMovies = 'https://api.themoviedb.org/3/movie/popular?';

  Future<List<moveModel>> getpopularMovies() async {
    final Response = await http.get(Uri.parse('$popularMovies$apiKey'));

    if (Response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(Response.body);
      List<dynamic> results = body['results'];
      List<moveModel> movies = results
          .map((movie) => moveModel.fromJson(movie as Map<String, dynamic>))
          .toList();
      // Logger().f(movies[0].posterPath);
      return movies;
    } else {
      Logger().e('Error - ${Response.statusCode}');
      return [];
    }
  }
}
