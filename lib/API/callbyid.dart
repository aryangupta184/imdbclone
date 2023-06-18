import 'dart:convert';

import 'package:dio/dio.dart';

class MovieIDAPI{

  static Future<List> call(String id) async {
    final dio = Dio();
    Response response;
    dio.options.headers["X-RapidAPI-Key"]="960651ec82msh57707d71adb67dep1d586fjsn25e70cabc634";
    dio.options.headers["X-RapidAPI-Host"]="movies-tv-shows-database.p.rapidapi.com";
    dio.options.headers["Type"]="get-movie-details";

    response = await dio.get(
      'https://movies-tv-shows-database.p.rapidapi.com/',
      queryParameters: {'movieid':id},
    );

    List desiredmoviedata=[];


    if (response.statusCode == 200) {
      final body = response.data;
      print(body);
      final desiredmoviedata=JsonDecoder(body) as List;
      print(desiredmoviedata);
      return desiredmoviedata;
    }
    else {
      throw Exception();
    }
  }

}


