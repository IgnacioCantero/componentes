import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alertas'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            shape: const StadiumBorder()  //StadiumBorder() -> Para hacer los bordes circulares
          ),
          onPressed: () {
            //Al presionar debería mostrar una alerta que viene del showdialog()
            return _mostrarAlerta(context);
          },
          child: const Text('Mostrar alerta')
        ),
      ),
    );
  }

  //FUNCIONES:
  _mostrarAlerta(BuildContext context) {
    showDialog(
      //barrierDismissible: false -> para hacer que el usuario no pueda cerrar el Alert tocando fuera:
      barrierDismissible: false,
        context: context,
        builder: (context) {
          //Si el terminal tiene sistema operativo iOS (iPhone, iPad, Mac):
          if(Platform.isIOS) { //IMPORTANTE: El Platform tiene que importarse de la librería 'dart:io'
            //AlertDialog() -> si quisieramos hacerlo al estilo normal (no de iOS, como este caso):
            return CupertinoAlertDialog(
              title: const Text('Título del alert'),
              content: Column(
                //Si al Column() no le decimos nada, él coge toda la altura del contenedor
                //mainAxisSize: MainAxisSize.min -> para que dicha altura ocupe el espacio mínimo necesario:
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Contenido del alert'),
                  FlutterLogo(size: 100,)
                ],
              ),
              actions: [
                TextButton(
                  //Navigator.of(context).pop() -> Para volver atrás en la pila de navegación:
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancelar')),
                TextButton(
                  //Navigator.of(context).pop() -> Para volver atrás en la pila de navegación:
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Aceptar'))
              ],
            );
          }
          //Si el terminal tiene cualquier otro sistema operativo:
          return AlertDialog(
            title: const Text('Título del alert'),
            content: Column(
              //Si al Column() no le decimos nada, él coge toda la altura del contenedor
              //mainAxisSize: MainAxisSize.min -> para que dicha altura ocupe el espacio mínimo necesario:
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Contenido del alert'),
                FlutterLogo(size: 100,)
              ],
            ),
            actions: [
              TextButton(
                //Navigator.of(context).pop() -> Para volver atrás en la pila de navegación:
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar')),
              TextButton(
                //Navigator.of(context).pop() -> Para volver atrás en la pila de navegación:
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Aceptar'))
            ],
            actionsAlignment: MainAxisAlignment.spaceAround,
          );
        });
  }
}

