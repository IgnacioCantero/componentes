import 'package:componentes/pages/alert_page.dart';
import 'package:componentes/pages/avatar_page.dart';
import 'package:componentes/pages/cards_page.dart';
import 'package:componentes/pages/home_page.dart';
import 'package:componentes/pages/inputs_page.dart';
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
      //Ajustar la localización (especificamos dónde se tiene que propagar el localization):
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home -> sirve si tenemos una única pantalla
      //routes -> sirve para tener varias pantallas
      routes: <String,WidgetBuilder>{
        //Creamos nuestras rutas:
        '/': (BuildContext context) => const HomePage(),
        'alert': (BuildContext context) => const AlertPage(),
        'avatar': (BuildContext context) => const AvatarPage(),
        'card': (BuildContext context) => const CardPage(),
        'inputs': (BuildContext context) => const InputPage(),
        'personajes': (BuildContext context) => PersonajesPage(),
      },
    );
  }
}
