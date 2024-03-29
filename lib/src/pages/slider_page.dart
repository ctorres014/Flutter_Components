import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded( // Para que use todo el espacio posible
              child: _crearImagen()
              )
          ],
        )
      ),
    );
  }




  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.cyan,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      onChanged: (_bloquearCheck) ? null : (valor) {
        setState(() {
         _valorSlider = valor;
        });
      },
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/3/38/Stranger_Things_logo.png'),
      width: _valorSlider,
      fit: BoxFit.contain, // Para que no se salga de los margenes y tome todo el contenido
    );
  }

  Widget _checkBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
         _bloquearCheck = valor; 
        });
      },
    );

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor) {
    //     setState(() {
    //      _bloquearCheck = valor; 
    //     });
    //   },
    // );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
         _bloquearCheck = valor; 
        });
      },
    );
  }


}