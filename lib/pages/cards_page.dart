import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card page'),
      ),
      //ListView -> tiene scroll
      //Column -> NO tiene scroll
      //SingleChildScrollView -> fuerza a tener scroll
      body: SingleChildScrollView(
        child: Column(
          children: [
            _cardTipoUno(),
            _cardTipoDos(),
            _cardTipoUno(),
            _cardTipoDos(),
            _cardTipoUno(),
            _cardTipoDos(),
            _cardTipoUno(),
            _cardTipoDos(),
            _cardTipoUno(),
            _cardTipoDos(),
          ],
        )
      ),
    );
  }

  //FUNCIONES:
  Widget _cardTipoUno() {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          const ListTile(
            leading: FlutterLogo(),
            title: Text('Título del card'),
            subtitle: Text('Subtítulo del card')
          ),
          const TextField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){}, child: const Text('Cancelar')),
              TextButton(onPressed: (){}, child: const Text('Aceptar'))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipoDos() {
    return Card(
      color: Colors.orange,
      margin: const EdgeInsets.all(20),
      //clipBehavior: Clip.antiAlias -> para redondear las esquinas en la imágen
      clipBehavior: Clip.antiAlias,
      //Para cambiar la pronunciación del borde de las esquinas:
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //elevation -> para aumentar la elevación de la card (y por tanto, la sombra)
      elevation: 30,
      shadowColor: Colors.purpleAccent,
      child: Column(
        children: [
          Image.network('https://img.remediosdigitales.com/87d1ce/coches-miticos-fast-and-furious-dodge-charger-toyota-supra-01/450_1000.jpeg'),
          const ListTile(
              leading: FlutterLogo(),
              title: Text('Título del card'),
              subtitle: Text('Subtítulo del card')
          ),
          const Text('Contenido de la noticia'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){}, child: const Text('Cancelar')),
              TextButton(onPressed: (){}, child: const Text('Aceptar'))
            ],
          )
        ],
      ),
    );
  }
}
