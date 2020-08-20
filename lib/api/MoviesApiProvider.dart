import 'dart:convert';

import 'package:flutter_movie/api/ApiResponse.dart';
import 'package:flutter_movie/utils/constants.dart';
import 'package:http/http.dart' show get;

class MoviesApiProvider {
  Future<List<dynamic>> fetchTrendingMovies() async {
    final response = await get(kTrendingMovies);
    final jsonBody = json.decode(response.body);
    return jsonBody['results'];
  }

}


