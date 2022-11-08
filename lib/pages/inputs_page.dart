import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  //Cuando llamemos a setState() se redibuja la página
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //VARIABLES (hay que inicializarlas):
    //Nombre:
  String nombre = '';
    //Password:
  bool _ojoPassword = true;
    //Calendario:
  TextEditingController _inputDateController = new TextEditingController();
    //Lista:
  List<String> _cosas = ['cosa1', 'cosa2', 'cosa3', 'cosa4', 'cosa5'];
  String _opcionSeleccionada = 'cosa1'; //Si no se quiere seleccionar una opción por defecto también serviría: "String _opcionSeleccionada = 'Seleccione un opción';"
    //CheckBox:
  bool isChecked = false;
    //RadioButtons:
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

  //FUNCIONES:
  Widget _nombreInput() {
    return TextField(
      //Control de la capitalización (Mayúsculas/minúsculas):
      textCapitalization: TextCapitalization.sentences,
      //Estilos:
      decoration: InputDecoration(
        //->borde:
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 15,  color: Colors.green),  //No funciona y no sabemos por qué
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        //->cambiar propiedades borde cuando el user haga click en el input:
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 5, color: Colors.amber),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        //->contador de caracteres escritos:
        counterText: nombre.length.toString() + '/20',
        //->estilo del contador:
        counterStyle: nombre.length >= 20 ? const TextStyle(color: Colors.red, fontSize: 14) : const TextStyle(color: Colors.blue),
        //->pista para el user (como el placeholder, pero cuando haga click en el input):
        hintText: 'Escriba su nombre',
        //->nombre del input:
        label: Text('Nombre'),
        //->pista extra para el user (se indica debajo del input y no se borra al escribir en él):
        helperText: 'Únicamente el nombre',
        //->icono:
        icon: const Icon(Icons.account_box),
      ),
      //Guardar lo que tengamos en el input:
      onChanged: (value) {
        //setState()->actualiza la vista
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
          borderSide: BorderSide(width: 15,  color: Colors.green),  //NO FUNCIONA Y NO SABEMOS POR QUÉ
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
            borderSide: BorderSide(width: 15,  color: Colors.green),  //NO FUNCIONA Y NO SABEMOS POR QUÉ
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
    //1º -> Crear el input:
    return TextField(
      controller: _inputDateController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 15,  color: Colors.green),  //NO FUNCIONA Y NO SABEMOS POR QUÉ
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          hintText: 'Escoja su fecha de nacimiento',
          label: Text('Fecha de nacimiento'),
          icon: Icon(Icons.date_range)
      ),
      //Mostrar el calendario al tocar el input:
      onTap: () {
        //Quitar el focus del input para que el calendario no desaparezca:
        FocusScope.of(context).requestFocus(new FocusNode());
        //Crear método que se encarga de pintar el calendario:
        _selectDate();
      },
    );
  }
  void _selectDate() async {
    //Crear variable para guardar la fecha que seleccione el user
    //Esta respuesta es en el futuro ya que se queda esperando a tener una selección por parte del user, por tanto, es una respuesta asíncrona -> async
    //await -> para indicar que debe esperar a la respuesta del user
    //Cuando llamemos a las Apis serán llamadas asincronas (async) de las respuestas (await)
    //DateTime? -> el interrogante es porque puede ser null si el user no indica una fecha
    DateTime? fechaSeleccionada = await showDatePicker(
        context: context,
        //initialDate -> fecha preseleccionada al abrir el DatePicker:
        initialDate: new DateTime.now(),
        //firstDate -> fecha mínima del calendario:
        firstDate: new DateTime(1920),
        //lastDate -> fecha tope del calendario:
        lastDate: new DateTime(2056),
        //Establecer los idiomas (localizaciones) soportados:
        //https://es.wikipedia.org/wiki/ISO_639-1
        locale: const Locale('es')
    );
    //Una vez recibida la respuesta, continuará la ejecución del método async
    if(fechaSeleccionada != null) {
      //El controller debe pintar la fecha parseada a String, para lo que necesitamos una librería intl que sirve entre otras cosas para parsear o formatear fechas. Para instalarla:
      //Terminal: flutter pub add intl ↵
      //Reiniciar la app
      setState(() {
        _inputDateController.text = DateFormat('dd-MM-yyyy').format(fechaSeleccionada);
      });
      //También se tiene que instalar otra librería para el idioma (español)
      //Escribir en el archivo pubspec.yaml:
      //flutter_localizations:
      //     sdk: flutter
      //Clickar en Pub get
      //Reiniciar la app
      //Establecer los idiomas (localizaciones) soportados en el 'DateTime?'
    }
  }

  Widget _opcionesList() {
    return DropdownButton(
      value: _opcionSeleccionada,
      //items -> elementos de la lista desplegable -> crearlos en un método aparte:
      items: getOpciones(),
      //onChanged -> manejar la lógica cuando el user seleccione uno de los elementos de la lista:
      onChanged: (value) {
        setState(() {
          _opcionSeleccionada = value.toString();
        });
      }
    );
  }
  List<DropdownMenuItem<String>> getOpciones() {
    //En base a la lista de opciones, devolver una lista de DropdownMenuItem (los elementos de la lista desplegable):
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
