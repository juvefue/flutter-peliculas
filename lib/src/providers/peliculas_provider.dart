import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = '44b4dd9539951955ae36000f72628228';
  String _url = 'api.themoviedb.org';
  String _language = 'es-Es';

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});
    //print(url);
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https(
        _url, '3/movie/popular', {'api_key': _apikey, 'language': _language});

    return await _procesarRespuesta(url);
  }
}

//https://api.themoviedb.org/3/movie/now_playing?api_key=44b4dd9539951955ae36000f72628228&language=es-Es
