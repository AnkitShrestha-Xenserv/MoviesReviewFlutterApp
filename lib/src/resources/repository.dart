import 'movies_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final moviesApiProvider = MoviesApiProvider();
  Future<List<ItemModel>> fetchMovies() {
    final movies = moviesApiProvider.fetchFillerData();
    return movies;
  }
}
