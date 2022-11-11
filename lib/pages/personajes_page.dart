import 'package:componentes/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:componentes/models/Characters.dart';

class PersonajesPage extends StatelessWidget {
  PersonajesPage({Key? key}) : super(key: key);
  ///SERVICIO:
  final HttpService http = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
      ),
      body: FutureBuilder(
        //todo: future -> para recibir los datos futuros
        future: http.getPersonajes(),
        builder: (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
          //todo: Comprobar si tenemos los datos o no:
          if(snapshot.hasData) {
            //todo: Pintar la lista de personajes:
            List<Character> chars = snapshot.data!;
            //todo: Iterar la lista y pintar un card por cada elemento:
            return ListView(
              children: chars.map((Character char) => Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Image(image: NetworkImage(char.image ?? ''), //todo: Si no tiene imagen que no pinte nada,
                      width: double.infinity, //todo: double.infinity -> para que coja T0D0 el ancho que pueda dentro del contenedor
                      fit: BoxFit.cover,  //todo: BoxFit.cover -> para que se cuadre T0D0 y no se deforme nada
                    ),
                    ListTile(
                      title: Text(char.name!),  //todo: Hemos especificado en las opciones del Dart class generator que todas las propiedades eran null-safety (pueden ser null) -> '!'
                      subtitle: Text(char.location!.name!),
                    )
                  ],
                ),
              )).toList(),
            );
          } else {
            return const Center(
              //todo: Devolver un spinner o un circular progress indicator:
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
