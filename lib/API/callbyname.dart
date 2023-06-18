import 'package:dio/dio.dart';

class MovieListAPI{

  static Future<List> call(String message) async {
    final dio = Dio();
    Response response;
    dio.options.headers["X-RapidAPI-Key"]="960651ec82msh57707d71adb67dep1d586fjsn25e70cabc634";
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


