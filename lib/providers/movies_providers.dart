import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_unidad1/models/movie.dart';
import 'package:proyecto_unidad1/models/models.dart';
import 'package:proyecto_unidad1/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _language = 'es-MX';

  List<Movie> OnDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    // print(decodeData);
    //print(response.body);
    final nowPLayingResponse = NowPlayingResponse.fromRawJson(response.body);
    OnDisplayMovies = nowPLayingResponse.results;
    // La comunicamos a todos los widgets que estan escuchando que se cambio la por lo tanto se debe redibujar
    notifyListeners();
    // print(nowPLayingResponse.results[0].title);
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromRawJson(response.body);

    //destructurar resultado para cambiar pagina y mantener los actuales
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
