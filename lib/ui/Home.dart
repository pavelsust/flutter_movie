import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/BLoC/MovieBloc.dart';
import 'package:flutter_movie/BLoC/bloc_provider.dart';
import 'package:flutter_movie/api/ApiResponse.dart';
import 'package:flutter_movie/models/trending_model.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var bloc = MovieBloc();
    bloc.fetchTrendingMovie();
    return BlocProvider<MovieBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movie App'),
        ),
        body: StreamBuilder<List<dynamic>>(
          stream: bloc.trendingMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return showList(snapshot.data);
            } else {
              return Center(
                child: Text("asd"),
              );
            }
          },
        ),
      ),
    );
  }

  Widget showList(List<dynamic> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int position) {
          TrendingModel trendingModel = TrendingModel.fromJson(list[position]);
          return ListTile(
            title: Text(trendingModel.title),
          );
        });
  }
}
