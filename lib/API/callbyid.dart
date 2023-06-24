import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:round2/API/callbyid.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:round2/API/movieparse.dart';

class MovieIDAPI{

  static Future<List> call(String id) async {
    final dio = Dio();
    final response;
    dio.options.headers["X-RapidAPI-Key"]="bb72b850f0msh562c04851d0f1a1p1a0ebcjsn813c727955e4";
    dio.options.headers["X-RapidAPI-Host"]="movies-tv-shows-database.p.rapidapi.com";
    dio.options.headers["Type"]="get-movie-details";



    response = await dio.get(
      'https://movies-tv-shows-database.p.rapidapi.com/',
      queryParameters: {'movieid':id},
    );
    print(response.data);

    // final response2;
    // dio.options.headers["X-RapidAPI-Key"]="bb72b850f0msh562c04851d0f1a1p1a0ebcjsn813c727955e4";
    // dio.options.headers["X-RapidAPI-Host"]="movies-tv-shows-database.p.rapidapi.com";
    // dio.options.headers["Type"]="get-movies-images-by-imdb";
    //
    //
    // response2 = dio.get(
    //   'https://movies-tv-shows-database.p.rapidapi.com/',
    //   queryParameters: {'movieid':id},
    // );

    List desiredmoviedata=[];

    desiredmoviedata.add(response.data['title']);
    desiredmoviedata.add(response.data['year']);
      // desiredmoviedata.add(response2.data['poster']);
      //
      //
      // desiredmoviedata.add(response2.data['fanart']);


    desiredmoviedata.add(response.data['imdb_rating']);
    desiredmoviedata.add(response.data['tagline']);
    desiredmoviedata.add(response.data['rated']);
    desiredmoviedata.add(response.data['description']);
    desiredmoviedata.add(response.data['youtube_trailer_key']);

    return desiredmoviedata;





    // List desiredmoviedata=[];
    // var list = json.decode(response) as List<dynamic>;
    // desiredmoviedata = list.map((model) => getmoviebyid.fromJson(model)).toList();
    // print(desiredmoviedata);
    // return desiredmoviedata;

    // List parsePost(String responseBody){
    //   var list = json.decode(responseBody) as List<dynamic>;
    //   var posts = list.map((model) => Post.fromJson(model)).toList();
    //   return posts;
    //
    // }
    //
    // Future<List> fetchPost() async{
    //   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    //   if (response.statusCode == 200){
    //     return compute(parsePost, response.body);
    //   }else {
    //     throw Exception("Request API Error");
    //   }
    // }


    // import 'dart:convert';
    // import 'package:flutter/foundation.dart';
    // import 'package:http/http.dart' as http;
    // import './post.dart';
    //
    // List<Post> parsePost(String responseBody){
    //   var list = json.decode(responseBody) as List<dynamic>;
    //   var posts = list.map((model) => Post.fromJson(model)).toList();
    //   return posts;
    //
    // }
    //
    // Future<List<Post>> fetchPost() async{
    //   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    //   if (response.statusCode == 200){
    //     return compute(parsePost, response.body);
    //   }else {
    //     throw Exception("Request API Error");
    //   }
    // }



  }

}


