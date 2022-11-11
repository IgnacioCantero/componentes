import 'package:flutter/material.dart';

class PasarInfoPage2 extends StatefulWidget {
  final String texto;

  const PasarInfoPage2({Key? key, this.texto = '' }) : super(key: key);

  @override
  State<PasarInfoPage2> createState() => _PasarInfoPage2State();
}

class _PasarInfoPage2State extends State<PasarInfoPage2> {

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda página'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.texto), //todo: widget.texto -> para poder acceder a la variable texto de la clase PasarInfoPage2
            Padding(
              padding: const EdgeInsets.all(32),
              child: TextField(
                controller: textEditingController,
              ),
            ),
            ElevatedButton(
                onPressed: () {_devolverDatos();},
                child: const Text('Devolver'),
            ),
          ],
        ),
      ),
    );
  }

  ///FUNCIONES:
  void _devolverDatos() {
    String text = textEditingController.text;
    Navigator.pop(context, text);
  }
}
