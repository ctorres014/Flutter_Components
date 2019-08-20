import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _listaNumeros = new List();
  int _ultimaImagen = 0;
  bool _isLoading = false;

  // Implementamos el controller del scroll
  ScrollController _scrollController = new ScrollController();
  // 
  @override
  void initState() {
    
    super.initState();
    _agregar10();

    // agregamos un listener al scrollcontroller
    _scrollController.addListener(() {

      // Evaluamos si la posicion del scroll en el momento actual
      // es igual a la posicion maxima del scroll en ese momento
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }

    });

  }

  @override
  void dispose() {
    
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(children: <Widget>[
        _crearLista(),
        _crearLoading(),
      ],)
    );
  }


  // crear un refresindicator

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {
        final image = _listaNumeros[index];

        return FadeInImage(
          image: NetworkImage('https://picsum.photos/id/$image/300/300'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fit: BoxFit.contain,
        );
      }, // Builder en flutter es la forma en la que se va a dibujar
    );

  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimaImagen++;
      _listaNumeros.add(_ultimaImagen);
    }
    // Necesito redibujar el widget
    setState(() {
      
    });
  }

  // Simulamos una peticion fetch y relentizamos la carga
  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);

    // return Future.delayed(duration);
  }

  void respuestaHTTP() {
    _isLoading = false;

    // Permitir visualizar un poco la siguiente imagen
    // para indicar que hay mas para ver
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );

    _agregar10();
  }

  Widget _crearLoading() {

    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    } else {
      return Container();
      
    }
  }

}