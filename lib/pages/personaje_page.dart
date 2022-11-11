import 'package:componentes/provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/Characters.dart';

class PersonajePage extends StatefulWidget {
  const PersonajePage({Key? key}) : super(key: key);

  @override
  State<PersonajePage> createState() => _PersonajePageState();
}

class _PersonajePageState extends State<PersonajePage> {
  ///VARIABLES -> las instaciamos:
  late Future<Character> char;
  HttpService http = HttpService();

  //todo: iniState() -> método que se ejecuta al cargar la página
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    char = http.getCharacter();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personaje'),
      ),
      body: FutureBuilder(
        future: char,
        builder: (BuildContext context, AsyncSnapshot<Character> snapshot) {
          if(snapshot.hasData) {
            return Center(
              child: Card(
                child: Column(
                  children: [
                    Image(image: NetworkImage(snapshot.data!.image!)),
                    ListTile(
                      title: Text(snapshot.data!.name!),
                      subtitle: Text(snapshot.data!.location!.name!),
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
