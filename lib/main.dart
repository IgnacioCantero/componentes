import 'package:componentes/pages/add_articulo_page.dart';
import 'package:componentes/pages/alert_page.dart';
import 'package:componentes/pages/avatar_page.dart';
import 'package:componentes/pages/cards_page.dart';
import 'package:componentes/pages/home_page.dart';
import 'package:componentes/pages/inputs_page.dart';
import 'package:componentes/pages/lista_compra_page.dart';
import 'package:componentes/pages/pasar_info_pagina_uno_page.dart';
import 'package:componentes/pages/personaje_page.dart';
import 'package:componentes/pages/personajes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      //todo: Ajustar la localización (especificamos dónde se tiene que propagar el localization):
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //todo: home -> sirve si tenemos una única pantalla
      //todo: routes -> sirve para tener varias pantallas
      routes: <String,WidgetBuilder>{
        //todo: Creamos nuestras rutas:
        '/': (BuildContext context) => const HomePage(),
        'alert': (BuildContext context) => const AlertPage(),
        'avatar': (BuildContext context) => const AvatarPage(),
        'card': (BuildContext context) => const CardPage(),
        'inputs': (BuildContext context) => const InputPage(),
        'personajes': (BuildContext context) => PersonajesPage(),
        'personaje': (BuildContext context) => const PersonajePage(),
        'page1': (BuildContext context) => const PasarInfoPage1(),
        'listacompra': (BuildContext context) => const ListaCompraPage(),
        'addArticulo': (BuildContext context) => const AddArticulosPage(),
      },
    );
  }
}
