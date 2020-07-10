import 'dart:async';
import '../remote/movieRemoteDS.dart';
import '../remote/moviesResponse.dart';

class MoviesRepo {
  final movieRemoteDS = MovieRemoteDS();

  Future<MoviesResponse> fetchAllMovies() => movieRemoteDS.fetchMovieList();
}


