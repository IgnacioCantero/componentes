import 'dart:convert';
import 'package:componentes/models/Characters.dart';
import 'package:http/http.dart';

class HttpService {
  ///URL para llamar a la Api:
  final String url = 'https://rickandmortyapi.com/api/character';

  ///Traer UN PERSONAJE en concreto en base a su id:
  //todo: Future -> respuesta algún tipo específico (por ejemplo, un String) que va a ocurrir en un futuro (método asíncrono)
  Future<Character> getCharacter() async {
    //todo: Http nos da un objeto de tipo response donde guardamos la respuesta de la Api
    //todo: Esto nos dará acceso a varias propiedad de la respuesta como el statuscode o el body
    Response res = await get(Uri.parse(url + '/1'));
    //todo: Asegurar que la respuesta es correcta -> statuscode = 200
    if(res.statusCode == 200) {
      return Character.fromJson(res.body);
    } else {
      //todo: Ha habido algún fallo:
      throw Exception('Fallo');
    }
  }

  ///Traer una LISTA DE PERSONAJES:
  Future<List<Character>> getPersonajes() async {
    Response res = await get(Uri.parse(url));
    if(res.statusCode == 200) {
      //todo: 1º -> Pasar el Json a List<dynamic> -> permite iterar (bucle for):
      List<dynamic> lista = jsonDecode(res.body)['results'];  //todo: ['results'] -> para que únicamente devuelva el contenido del Json que hay dentro de 'results'
      //todo: 2º -> Iterar para pasar cada elemento de la lista a tipo Character:
      List<Character> characters = lista.map((item) => Character.fromJson(item)).toList();
      return characters;
    } else {
      //todo: Ha habido algún fallo:
      throw Exception('Fallo');
    }
  }
}
