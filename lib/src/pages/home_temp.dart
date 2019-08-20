import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco', 'seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
        centerTitle: true
        ),
        body: ListView(
          // children: _crearItems(),
          children: _crearItemsCorta(),      
          // children: <Widget>[
          //   ListTile(title: Text('List Title'),)
          // ],
        ),
      );
  }

  List<Widget> _crearItems() {

    List<Widget> list = new List<Widget>();

    for (var opcion in opciones) {
      final title = ListTile(title: Text(opcion),);
      list..add(title)
          ..add(Divider());
    }
    return list;
  }

  List<Widget> _crearItemsCorta() {
    // opciones.map(f) retorna una nueva lista 
    // con los elementos a iterar
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.mood),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

    
  }
}