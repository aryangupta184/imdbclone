import 'package:dio/dio.dart';

class MovieListAPI{

  static Future<List> call(String message) async {
    final dio = Dio();
    Response response;
    dio.options.headers["X-RapidAPI-Key"]="bb72b850f0msh562c04851d0f1a1p1a0ebcjsn813c727955e4";
    dio.options.headers["X-RapidAPI-Host"]="movies-tv-shows-database.p.rapidapi.com";
    dio.options.headers["Type"]="get-movies-by-title";

    response = await dio.get(
      'https://movies-tv-shows-database.p.rapidapi.com/',
      queryParameters: {'title':message},
    );

    List moviedata=[];


    if (response.statusCode == 200) {
      final body = response.data;
      final moviedata = body['movie_results'] as List;
      print(moviedata);
      return moviedata;
    }
    else {
      throw Exception();
    }
  }

}


