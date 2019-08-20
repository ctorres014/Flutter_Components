import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cards'),
        ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,), // Define un espacio entre cards
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
  return Card(
    elevation: 10.0, // Le da una apariencia de sombra
    shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(10.0) 
    ),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Soy el titulo de la tarjeta'),
          subtitle: Text('Aqui estamos con la descripcion de la tarjeta para que ustedes vean lo que quiero mostrarles'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(child: Text('Cancelar'), onPressed: (){},),
            FlatButton(child: Text('OK'), onPressed: (){},)
          ],
        )
      ],
    ),
  );
}

  Widget  _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias, // Nada del contenido se salga de la tarjeta
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://flickrtheblog.files.wordpress.com/2017/11/10285894466_b72616f2c1_b.jpg?w=1024&h=423&crop=1'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover // Como la imagen debe ocupar el espacio que tiene
            ),
          // Image(
          //   image: NetworkImage('https://flickrtheblog.files.wordpress.com/2017/11/10285894466_b72616f2c1_b.jpg?w=1024&h=423&crop=1'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner')
            )
        ],
        ),
    );
  
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0, // Aspecto sombra
            spreadRadius: 2.0, // Que tanto se extienda la sombra
            offset: Offset(2.0, 10.0) // Posicion sobre eje cartesiano
          )
        ]
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(10.0),
        ), // ClipRRect Permite cortar cualquier cosa fuera del contenedor
      
    );
  }
  
}

