//1º - Importar material:
import 'package:flutter/material.dart';

//2º - Crear la página de tipo 'stless'(no tiene que cambiar) o 'stfull'(tiene que cambiar):
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Creación de variables:
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
      }
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: ListView.builder(
        //ListView.builder -> necesita saber el tamaño de la lista:
        itemCount: componentes.length,
        //context -> hace referencia al stateless o al stateful widget (al widget
        // padre donde se está pintando)
        itemBuilder: (BuildContext context, int index) {
          //Card -> poner bordes al ListTile
          return Card(
            margin: const EdgeInsets.all(7),
            child: ListTile(
              onTap: () {
                //Navegación entre pantallas:
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













