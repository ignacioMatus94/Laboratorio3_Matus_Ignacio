import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Contador extends StatefulWidget {
  const Contador({Key? key}) : super(key: key);

  @override
  State<Contador> createState() => _ContadorPantallaState();
}

class _ContadorPantallaState extends State<Contador> {
  int _clickContador = 0;
  Color _backgroundColor = Colors.blue;

  // Mapa de idiomas con el título de la aplicación
  Map<String, String> _titulos = {
    'es': 'Contador de Clicks', // Título en español
    'en': 'Click Counter', // Título en inglés
  };

  // Idioma actual (por defecto: español)
  String _idiomaActual = 'es';

  void _incrementarContador() {
    setState(() {
      _clickContador++;
    });
  }

  void _decrementarContador() {
    setState(() {
      if (_clickContador > 0) {
        _clickContador--;
      }
    });
  }

  void _reiniciarContador() {
    setState(() {
      _clickContador = 0;
    });
  }

  void _mostrarSelectorColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecciona un color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _backgroundColor,
              onColorChanged: (color) {
                setState(() {
                  _backgroundColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void _cambiarIdioma() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecciona un idioma:'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text('Español'),
                  onTap: () {
                    setState(() {
                      _idiomaActual = 'es';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text('Inglés'),
                  onTap: () {
                    setState(() {
                      _idiomaActual = 'en';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                // Agrega más idiomas aquí según sea necesario
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraApp(),
      body: centerLetras(),
      floatingActionButton: filaContador(),
    );
  }

  Row filaContador() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: _decrementarContador,
          child: Icon(Icons.remove),
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          onPressed: _incrementarContador,
          child: Icon(Icons.add),
        ),
      ],
    );
  }

  Center centerLetras() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_clickContador',
            style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
          ),
          Text(
            'Clicks',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }

  AppBar barraApp() {
    return AppBar(
      title: Text(_titulos[_idiomaActual]!),
      backgroundColor: _backgroundColor,
      actions: [
        IconButton(
          onPressed: _reiniciarContador,
          icon: Icon(Icons.refresh),
        ),
        IconButton(
          onPressed: _mostrarSelectorColor,
          icon: Icon(Icons.color_lens),
        ),
        IconButton(
          onPressed: _cambiarIdioma,
          icon: Icon(Icons.language),
        ),
      ],
    );
  }
}
