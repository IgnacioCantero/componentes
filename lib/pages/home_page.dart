//todo: 1º - Importar material:
import 'package:flutter/material.dart';

//todo: 2º - Crear la página de tipo 'stless'(NO tiene que cambiar) o 'stfull'(tiene que cambiar):
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///VARIABLES -> inicializarlas:
    final List<Map<String, dynamic>> componentes = [
      {
        'title': 'Alertas',
        'icon': const Icon(Icons.message_outlined),
        'ruta': 'alert'
      },
      {
        'title': 'Avatares',
        'icon': const Icon(Icons.account_circle_outlined),
        'ruta': 'avatar'
      },
      {
        'title': 'Cards',
        'icon': const Icon(Icons.format_align_justify_rounded),
        'ruta': 'card'
      },
      {
        'title': 'Inputs',
        'icon': const Icon(Icons.check_box_outlined),
        'ruta': 'inputs'
      },
      {
        'title': 'Personajes Rick&Morty',
        'icon': const Icon(Icons.person_add_alt),
        'ruta': 'personajes'
      },
      {
        'title': 'Personaje Rick&Morty',
        'icon': const Icon(Icons.person_outline),
        'ruta': 'personaje'
      },
      {
        'title': 'Pasar info entre páginas',
        'icon': const Icon(Icons.info_outline),
        'ruta': 'page1'
      },
      {
        'title': 'Lista de la compra',
        'icon': const Icon(Icons.shopping_cart_outlined),
        'ruta': 'listacompra'
      },
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: ListView.builder(
        //todo: ListView.builder -> necesita saber el tamaño de la lista:
        itemCount: componentes.length,
        //todo: context -> hace referencia al stateless o al stateful widget (al widget padre donde se está pintando)
        itemBuilder: (BuildContext context, int index) {
          //todo: Card -> poner bordes al ListTile
          return Card(
            margin: const EdgeInsets.all(7),
            child: ListTile(
              onTap: () {
                //todo: Navegación entre pantallas:
                Navigator.pushNamed(context, componentes[index]['ruta']);
              },
              title: Text(componentes[index]['title']),
              leading: componentes[index]['icon'],
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            )
          );
        },
      ),
    );
  }
}
