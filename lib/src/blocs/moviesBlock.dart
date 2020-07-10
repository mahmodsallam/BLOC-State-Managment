import 'package:rxdart/rxdart.dart';

import '../data/remote/moviesResponse.dart';
import '../data/repo/MoviesRepo.dart';

class MoviesBloc {
  final _repository = MoviesRepo();
  final _moviesFetcher = PublishSubject<MoviesResponse>();

  // it is a property
  Observable<MoviesResponse> get allMovies =>
      _moviesFetcher.stream; // publisher

  fetchAllMovies() async {
    MoviesResponse moviesResponse = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(moviesResponse);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final moviesBloc = MoviesBloc();
