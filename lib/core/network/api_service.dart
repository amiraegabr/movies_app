import 'package:dio/dio.dart';
import '../../models/movie_model.dart';

class ApiService {
  final _dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
  ));

  final String _apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed";

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await _dio.get("/movie/popular", queryParameters: {
        'api_key': _apiKey,
      });
      if (response.statusCode == 200) {
        final List results = response.data['results'];
        return results.map((m) => MovieModel.fromJson(m)).toList();
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getMoviesByGenre(int genreId) async {
    try {
      final response = await _dio.get("/discover/movie", queryParameters: {
        'api_key': _apiKey,
        'with_genres': genreId,
      });
      if (response.statusCode == 200) {
        final List results = response.data['results'];
        return results.map((m) => MovieModel.fromJson(m)).toList();
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
