import 'dart:async';

import 'package:flutter_movie/BLoC/bloc.dart';
import 'package:flutter_movie/api/ApiResponse.dart';
import 'package:flutter_movie/api/MoviesApiProvider.dart';

class MovieBloc implements Bloc {
  var movieApiProvider = MoviesApiProvider();
  var _trendingMovieController = StreamController<ApiResponse<dynamic>>();

  Stream<ApiResponse<dynamic>> get trendingMovie =>
      _trendingMovieController.stream;

  void fetchTrendingMovie() async {
    return movieApiProvider.fetchTrendingMovies().then((value) {
      _trendingMovieController.sink.add(value);
    });
  }

  @override
  void dispose() {
    _trendingMovieController.close();
  }
}
