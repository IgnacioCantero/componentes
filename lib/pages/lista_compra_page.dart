import 'package:componentes/pages/add_articulo_page.dart';
import 'package:flutter/material.dart';
import '../models/Articulo.dart';

class ListaCompraPage extends StatefulWidget {
  const ListaCompraPage({Key? key}) : super(key: key);

  @override
  State<ListaCompraPage> createState() => _ListaCompraPageState();
}

class _ListaCompraPageState extends State<ListaCompraPage> {
  ///VARIABLES -> inicializarlas:
  List<Articulo> listaCompra = [];
  double totalFinal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de la compra'),
        //todo: Para visualizar la suma total del precio de los artículos:
        actions: [
          Padding(padding: const EdgeInsets.all(12),
          child: Text('Total: ${totalFinal.toString()}€'),)
        ],
      ),
      body: ListView.builder( //todo: builder -> recorre la lista y devuelve un widget por cada elemento
        itemCount: listaCompra.length,
        itemBuilder: (BuildContext context, int index) {
          //todo: Comprobar si la lista está vacía:
          if(listaCompra.isEmpty) {
            return const Center(
              child: Text('Lista Vacía: por favor, añada artículos'),
            );
          }
          return ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: Text('${listaCompra[index].nombre} - ${listaCompra[index].cantidad}'),
            subtitle: Text('Total: ${listaCompra[index].total}€'),
            trailing: GestureDetector(
              onLongPress: () {
                //todo: Borrar el elemento en la posición index de la lista de la compra:
                setState(() {
                  totalFinal -= listaCompra[index].total!;
                  listaCompra.removeAt(index);
                });
              },
              child: const Icon(Icons.delete_outline, color: Colors.red),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        //todo: Navegar a otra página donde introduciremos los datos del artículo y se quedará a la espera de recibir ese artículo y pintarlo en la lista
        child: const Icon(Icons.add),
        onPressed: () async {
          final Articulo? articulo = await Navigator.push(context,
            MaterialPageRoute(builder: (context)=>const AddArticulosPage())
          );
          //todo: Añadir el artículo a la lista:
          if(articulo != null) {
            setState(() {
              listaCompra.add(articulo);
              totalFinal += articulo.total!;
            });
          }
        },
      ),
    );
  }
}
