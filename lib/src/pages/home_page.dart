import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Componentes'),),
        body: _lista(),
    );
  }

  Widget _lista() {
    // La siguiente instruccion para peticiones que puedan
    // tardar mas de 2 o 3 segundos no es viable ya que 
    // la pantalla de la app pareceria como congelada
    // menuProvider.cargarData().then((opciones) {
    //   print('_lista');
    //   print(opciones);
    // });
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
    
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          // Navegacion Normal
          // final route = MaterialPageRoute(
          //   builder: (context) {
          //     return AlertPage();
          //   }
          // );
          // // Navegamos a una nueva pantalla
          // Navigator.push(context, route);
        },
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });
    return opciones;
  }



}