import 'package:componentes/models/Articulo.dart';
import 'package:flutter/material.dart';

class AddArticulosPage extends StatefulWidget {
  const AddArticulosPage({Key? key}) : super(key: key);

  @override
  State<AddArticulosPage> createState() => _AddArticulosPageState();
}

class _AddArticulosPageState extends State<AddArticulosPage> {
  ///VARIABLES -> las inicializamos:
  TextEditingController _nombre = TextEditingController();
  TextEditingController _cantidad = TextEditingController();
  TextEditingController _precio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir artículo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min, //todo: MainAxisSize.min -> la altura de la columna ocupe lo mínimo posible para albergar el contenido (MainAxisSize.max coge toda la altura disponible)
            children: [
              _nombreInput(),
              const SizedBox(height: 10),
              Row(
                children: [
                  //todo: Flexible -> obliga al componente que tiene dentro (cantidadInput) a adaptarse al contenedor
                  Flexible(child: _cantidadInput()),
                  const SizedBox(width: 10),
                  Flexible(child: _precioInput()),
                ],
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: _nombre.text.isNotEmpty && _precio.text.isNotEmpty && _cantidad.text.isNotEmpty ? () {
                  Articulo articulo = Articulo(_nombre.text, int.parse(_cantidad.text), double.parse(_precio.text));
                  Navigator.pop(context, articulo);
                } : null,
                child: const Text('Añadir artículo'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///FUNCIONES:
  Widget _nombreInput() {
    return TextField(
      controller: _nombre,
      onChanged: (value) { setState(() {}); }, //todo: Refrescar el estado de la aplicación cada vez
      decoration: const InputDecoration(
        border: OutlineInputBorder( //todo: OutlineInputBorder -> crea un borde
          borderSide: BorderSide(color: Colors.green, width: 2.0) //todo: BorderSide -> manejar el color y el tamaño del borde
        ),
        label: Text('Nombre del artículo'),
      ),
    );
  }

  Widget _cantidadInput() {
    return TextField(
      controller: _cantidad,
      onChanged: (value) { setState(() {}); }, //todo: Refrescar el estado de la aplicación cada vez
      decoration: const InputDecoration(
        border: OutlineInputBorder( //todo: OutlineInputBorder -> crea un borde
            borderSide: BorderSide(color: Colors.green, width: 2.0) //todo: BorderSide -> manejar el color y el tamaño del borde
        ),
        label: Text('Cantidad'),
      ),
      keyboardType: TextInputType.number, //todo: keyboardType: TextInputType.number -> mostrar teclado numérico
    );
  }

  Widget _precioInput() {
    return TextField(
      controller: _precio,
      onChanged: (value) { setState(() {}); }, //todo: Refrescar el estado de la aplicación cada vez
      decoration: const InputDecoration(
        border: OutlineInputBorder( //todo: OutlineInputBorder -> crea un borde
            borderSide: BorderSide(color: Colors.green, width: 2.0) //todo: BorderSide -> manejar el color y el tamaño del borde
        ),
        label: Text('Precio'),
      ),
      keyboardType: TextInputType.number, //todo: keyboardType: TextInputType.number -> mostrar teclado numérico
    );
  }

}
