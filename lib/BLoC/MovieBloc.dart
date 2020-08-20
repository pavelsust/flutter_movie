import 'dart:async';

import 'package:flutter_movie/BLoC/bloc.dart';
import 'package:flutter_movie/api/MoviesApiProvider.dart';

class MovieBloc implements Bloc {
  var movieApiProvider = MoviesApiProvider();
  var _trendingMovieController = StreamController<List<dynamic>>();

  Stream<List<dynamic>> get trendingMovie => _trendingMovieController.stream;

  void fetchTrendingMovie() async {
    var result = await movieApiProvider.fetchTrendingMovies();
    _trendingMovieController.sink.add(result);
  }

  @override
  void dispose() {
    _trendingMovieController.close();
  }
}
