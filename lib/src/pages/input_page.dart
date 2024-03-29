import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = [ 'Volar', 'Rayos X', 'Aliento', 'Velocidad' ];

  // Esta propuedad me va a permiter manejar una relacion con la caja de texto de fecha
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
           Divider(),
          _crearDropdown(),
          Divider(),
          _crearLabel(),
          
        ],
      ),
    );
  }

 Widget _crearInput() {
   return TextField(
     autofocus: true,
     textCapitalization: TextCapitalization.sentences,
     decoration: InputDecoration(
       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
       counter: Text('Cantidad de letras ${ _nombre.length }'),
       hintText: 'Texto de sugerencia',
       labelText: 'Nombre',
       helperText: 'Sólo es el nombre',
       suffixIcon: Icon(Icons.accessibility_new),
       icon: Icon(Icons.account_circle)
     ),
     onChanged: (valor){
       setState(() {
        _nombre = valor; 
       });
     },
   );
 }

 Widget _crearEmail() {
   return TextField(
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
       hintText: 'Email',
       labelText: 'Email',
       suffixIcon: Icon(Icons.alternate_email),
       icon: Icon(Icons.email)
     ),
     onChanged: (valor){
       setState(() {
        _email = valor; 
       });
     },
   );
 }

 Widget _crearPassword() {
   return TextField(
     obscureText: true,
     decoration: InputDecoration(
       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
       hintText: 'Password',
       labelText: 'Password',
       suffixIcon: Icon(Icons.lock),
       icon: Icon(Icons.lock)
     )
   );
 }

 Widget _crearFecha(context) {
   return TextField(
     enableInteractiveSelection: false,
     controller: _inputFieldDateController,
     decoration: InputDecoration(
       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
       hintText: 'Fecha de Nacimiento',
       labelText: 'Fecha de Nacimiento',
       suffixIcon: Icon(Icons.calendar_today),
       icon: Icon(Icons.calendar_today)
     ),
     onTap: () {
       // quitamos foco
       FocusScope.of(context).requestFocus(new FocusNode());
       _selectDate(context);
     },
   );
 }


_selectDate(BuildContext context) async {
  // El showDatePicker devuelve un future que resuelve el datetime
  // con lo cual debemos usar el async y el await
  DateTime picked = await showDatePicker(
    context: context,
    initialDate: new DateTime.now(),
    firstDate: new DateTime(2018),
    lastDate: new DateTime(2020),
    locale:  Locale('es', 'ES')
  );

  // 
  if(picked != null) {
    setState(() {
     _fecha = picked.toString();
     _inputFieldDateController.text = _fecha;
    });
  }
}

// function
List<DropdownMenuItem<String>> getOpcionesDropdown() {
  List<DropdownMenuItem<String>> opciones = new List<DropdownMenuItem<String>>();

  _poderes.forEach((opt) {
    opciones.add(DropdownMenuItem(
      child: Text(opt),
      value: opt, // El value tiene que ser el tipo
    ));
  });

  return opciones;
}

Widget _crearDropdown() {
  return Row(
    children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0,), // Para realizar una separacion
      Expanded(
          child: DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
          setState(() {
            _opcionSeleccionada = opt; 
          });
          },
        ),
      )
    ],
  );
   
}

 Widget _crearLabel() {
   return ListTile(
     title: Text('Nombre es $_nombre'), 
     subtitle: Text('El email es $_email'),
     trailing: Text('Valor seleccionado es $_opcionSeleccionada'),
     );
  }


}

