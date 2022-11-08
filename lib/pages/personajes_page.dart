import 'package:componentes/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:componentes/models/Characters.dart';

class PersonajesPage extends StatelessWidget {
  PersonajesPage({Key? key}) : super(key: key);
  //Servicio:
  final HttpService http = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
      ),
      body: FutureBuilder(
        //future -> para recibir los datos futuros
        future: http.getPersonajes(),
        builder: (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
          //1º -> Comprobar si tenemos los datos o no:
          if(snapshot.hasData) {
            return const Text('Ya tengo datos');
          } else {
            return const Text('Todavía NO tengo datos', style: TextStyle(fontSize: 35));
          }
        },
      ),
    );
  }
}
