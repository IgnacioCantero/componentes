import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  //Cuando llamemos a setState() se redibuja la página
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  ///VARIABLES -> inicializarlas:
    ///Nombre:
  String nombre = '';
    ///Password:
  bool _ojoPassword = true;
    ///Calendario:
  TextEditingController _inputDateController = new TextEditingController();
    ///Lista:
  List<String> _cosas = ['cosa1', 'cosa2', 'cosa3', 'cosa4', 'cosa5'];
  String _opcionSeleccionada = 'cosa1'; //todo: Si no se quiere seleccionar una opción por defecto también serviría: "String _opcionSeleccionada = 'Seleccione un opción';"
    ///CheckBox:
  bool isChecked = false;
    ///RadioButtons:
  String animal = 'perro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          _nombreInput(),
          Text(nombre),
          const SizedBox(height: 20),
          _emailInput(),
          const SizedBox(height: 20),
          _passwordInput(),
          const SizedBox(height: 20),
          _datePickerInput(),
          const SizedBox(height: 20),
          _opcionesList(),
          const SizedBox(height: 20),
          _checkBox(),
          const SizedBox(height: 20),
          _radioButtons()
        ],
      ),
    );
  }

  ///FUNCIONES:
  Widget _nombreInput() {
    return TextField(
      //todo: Control de la capitalización (Mayúsculas/minúsculas):
      textCapitalization: TextCapitalization.sentences,
      //todo: Estilos:
      decoration: InputDecoration(
        //todo: ->borde:
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 15,  color: Colors.green),  //No funciona y no sabemos por qué
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        //todo: ->cambiar propiedades borde cuando el user haga click en el input:
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 5, color: Colors.amber),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        //todo: ->contador de caracteres escritos:
        counterText: nombre.length.toString() + '/20',
        //todo: ->estilo del contador:
        counterStyle: nombre.length >= 20 ? const TextStyle(color: Colors.red, fontSize: 14) : const TextStyle(color: Colors.blue),
        //todo: ->pista para el user (como el placeholder, pero cuando haga click en el input):
        hintText: 'Escriba su nombre',
        //todo: ->nombre del input:
        label: const Text('Nombre'),
        //todo: ->pista extra para el user (se indica debajo del input y no se borra al escribir en él):
        helperText: 'Únicamente el nombre',
        //todo: ->icono:
        icon: const Icon(Icons.account_box),
      ),
      //todo: Guardar lo que tengamos en el input:
      onChanged: (value) {
        //todo: setState()->actualiza la vista
        setState(() {
          nombre = value;
        });
      },
    );
  }

  Widget _emailInput() {
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 15,  color: Colors.green),  ///NO FUNCIONA Y NO SABEMOS POR QUÉ
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        hintText: 'Escribe tu email',
        label: Text('Email'),
        icon: Icon(Icons.email)
      ),
    );
  }

  Widget _passwordInput() {
    return TextField(
      obscureText: _ojoPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(width: 15,  color: Colors.green),  ///NO FUNCIONA Y NO SABEMOS POR QUÉ
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        hintText: 'Escribe una constraseña',
        label: const Text('Password'),
        icon: const Icon(Icons.password),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.remove_red_eye),
          onTap: () {
            setState(() {
              _ojoPassword = !_ojoPassword;
            });
          },
        ),
      ),
    );
  }

  Widget _datePickerInput() {
    //todo: 1º -> Crear el input:
    return TextField(
      controller: _inputDateController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 15,  color: Colors.green),  ///NO FUNCIONA Y NO SABEMOS POR QUÉ
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          hintText: 'Escoja su fecha de nacimiento',
          label: Text('Fecha de nacimiento'),
          icon: Icon(Icons.date_range)
      ),
      //todo: Mostrar el calendario al tocar el input:
      onTap: () {
        //todo: Quitar el focus del input para que el calendario no desaparezca:
        FocusScope.of(context).requestFocus(new FocusNode());
        //todo: Crear método que se encarga de pintar el calendario:
        _selectDate();
      },
    );
  }
  void _selectDate() async {
    //todo: Crear variable para guardar la fecha que seleccione el user
    //todo: Esta respuesta es en el futuro ya que se queda esperando a tener una selección por parte del user, por tanto, es una respuesta asíncrona -> async
    //todo: await -> para indicar que debe esperar a la respuesta del user
    //todo: Cuando llamemos a las Apis serán llamadas asíncronas (async) de las respuestas (await)
    //todo: DateTime? -> el interrogante es porque puede ser null si el user no indica una fecha
    DateTime? fechaSeleccionada = await showDatePicker(
        context: context,
        //todo: initialDate -> fecha preseleccionada al abrir el DatePicker:
        initialDate: new DateTime.now(),
        //todo: firstDate -> fecha mínima del calendario:
        firstDate: new DateTime(1920),
        //todo: lastDate -> fecha tope del calendario:
        lastDate: new DateTime(2056),
        //todo: Establecer los idiomas (localizaciones) soportados:
        //todo: https://es.wikipedia.org/wiki/ISO_639-1
        locale: const Locale('es')
    );
    //todo: Una vez recibida la respuesta, continuará la ejecución del método async
    if(fechaSeleccionada != null) {
      //todo: El controller debe pintar la fecha parseada a String, para lo que necesitamos una librería intl que sirve entre otras cosas para parsear o formatear fechas. Para instalarla:
      //todo: Terminal: flutter pub add intl ↵
      //todo: Reiniciar la app
      setState(() {
        _inputDateController.text = DateFormat('dd-MM-yyyy').format(fechaSeleccionada);
      });
      //todo: También se tiene que instalar otra librería para el idioma (español)
      //todo: Escribir en el archivo pubspec.yaml:
      //flutter_localizations:
      //     sdk: flutter
      //todo: Clickar en Pub get
      //todo: Reiniciar la app
      //todo: Establecer los idiomas (localizaciones) soportados en el 'DateTime?'
    }
  }

  Widget _opcionesList() {
    return DropdownButton(
      value: _opcionSeleccionada,
      //todo: items -> elementos de la lista desplegable -> crearlos en un método aparte:
      items: getOpciones(),
      //todo: onChanged -> manejar la lógica cuando el user seleccione uno de los elementos de la lista:
      onChanged: (value) {
        setState(() {
          _opcionSeleccionada = value.toString();
        });
      }
    );
  }
  List<DropdownMenuItem<String>> getOpciones() {
    //todo: En base a la lista de opciones, devolver una lista de DropdownMenuItem (los elementos de la lista desplegable):
    List<DropdownMenuItem<String>> lista = [];
    _cosas.forEach((cosa) {
      lista.add(
        DropdownMenuItem(
          value: cosa,
          child: Text(cosa),
        ),
      );
    });
    return lista;
  }

  Widget _checkBox() {
    return ListTile(
      title: const Text('Acepto los términos'),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }

  Widget _radioButtons() {
    return Column(
      children: [
        const Text('Seleccione su animal de preferencia:'),
        ListTile(
          title: const Text('gato'),
          leading: Radio<String>(
            value: 'gato',
            groupValue: animal,
            onChanged: (String? value) {
              setState(() {
                animal = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('perro'),
          leading: Radio<String>(
            value: 'perro',
            groupValue: animal,
            onChanged: (String? value) {
              setState(() {
                animal = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('tortuga'),
          leading: Radio<String>(
            value: 'tortuga',
            groupValue: animal,
            onChanged: (String? value) {
              setState(() {
                animal = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
