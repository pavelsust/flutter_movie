import 'dart:convert';

import 'package:flutter_movie/api/ApiResponse.dart';
import 'package:flutter_movie/utils/constants.dart';
import 'package:http/http.dart' show get;

class MoviesApiProvider {
  Future<ApiResponse<dynamic>> fetchTrendingMovies() async {
    return get(kTrendingMovies).then((value) {
      if (value.statusCode == 200) {
        var jsonBody = json.decode(value.body);
        return ApiResponse<dynamic>(data: jsonBody['results']);
      }
      return ApiResponse<dynamic>(error: true, errorMessage: "No value found ");
    }).catchError((error) {
      return ApiResponse<dynamic>(error: true, errorMessage: error.toString());
    });
  }
}
