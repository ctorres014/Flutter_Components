import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    
   }
  
  // El future resuelve un tiempo despues la informacion
  // que genera el metodo
  Future<List<dynamic>> cargarData() async {
    final respuesta = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(respuesta);

    opciones = dataMap['rutas'];

    return opciones;
  }

}
// Declaramos la clase privada y mediante la instancia del objeto
// especificamos que vamos a usar solo una instancia para nuestra app
final menuProvider = new _MenuProvider();