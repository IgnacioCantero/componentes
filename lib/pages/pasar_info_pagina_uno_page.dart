import 'package:componentes/pages/pasar_info_pagina_dos_page.dart';
import 'package:flutter/material.dart';

class PasarInfoPage1 extends StatefulWidget {
  const PasarInfoPage1({Key? key}) : super(key: key);

  @override
  State<PasarInfoPage1> createState() => _PasarInfoPage1State();
}

class _PasarInfoPage1State extends State<PasarInfoPage1> {
  ///VARIABLES -> inicializarlas:
  TextEditingController textEditingController = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página padre'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(32),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed:() {_enviarDatos();},
              child: const Text('Enviar')
            ),
            ElevatedButton(
              onPressed:() {_recibirDatos();},
              child: const Text('Recibir')
            ),
            ElevatedButton(
              onPressed:() {_enviarYRecibirDatos();},
              child: const Text('Enviar & Recibir')
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  ///FUNCIONES:
  _enviarDatos() {
    String textToSend = textEditingController.text;
    //todo: Lógica para enviar el texto -> crear antes una segunda página
    Navigator.push(context, MaterialPageRoute(builder: (context) => PasarInfoPage2 (texto: textToSend)));
  }

  void _recibirDatos() async {
    final resultado = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> const PasarInfoPage2())
    );
    setState(() {
      text = resultado;
    });
  }

  void _enviarYRecibirDatos() async {
    final resultado = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> PasarInfoPage2(texto: textEditingController.text))
    );
    setState(() {
      text = resultado;
    });
  }
}
