import 'package:flutter/material.dart';
import 'package:flutter_movie/BLoC/MovieBloc.dart';
import 'package:flutter_movie/BLoC/bloc_provider.dart';
import 'package:flutter_movie/ui/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      bloc: MovieBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Home()),
    );
  }
}
