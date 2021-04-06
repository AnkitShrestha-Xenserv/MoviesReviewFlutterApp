import 'package:movies_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MoviesBloc {
  final _moviesController = BehaviorSubject<List<ItemModel>>();
  final _repository = Repository();

  Observable<List<ItemModel>> get movies => _moviesController.stream;

  fetchMovies() async {
    final movies = await _repository.fetchMovies();
    _moviesController.sink.add(movies);
  }

  void dispose() {
    _moviesController.close();
  }
}
