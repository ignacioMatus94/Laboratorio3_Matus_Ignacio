import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hola/presentation/pantalla/Lista.dart';
import 'detalles.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';


class Contador extends StatefulWidget {
  const Contador({Key? key}) : super(key: key);

  @override
  State<Contador> createState() => _ContadorPantallaState();
}

class _ContadorPantallaState extends State<Contador> {
  int _clickContador = 0;
  Color _backgroundColor = Colors.blue;

  final Map<String, String> _titulos = {
    'es': 'Contador de Clicks',
    'en': 'Click Counter',
  };

  String _idiomaActual = 'es';

  void _incrementarContador() {
    setState(() {
      if (_clickContador < 15) {
        _clickContador++;
        if (_clickContador == 15) {
          _mostrarMensajeTriunfo();
        }
        if (_clickContador == 10) {
          _mostrarMensajeDerrota();
        }
      }
    });
  }

  void _mostrarMensajeTriunfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Triunfaste!'),
        content: const Text('Has alcanzado el máximo de 15 clics.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _decrementarContador() {
    setState(() {
      if (_clickContador > 0) {
        _clickContador--;
        if (_clickContador == 10) {
          _mostrarMensajeDerrota();
        }
      }
    });
  }

  void _mostrarMensajeDerrota() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Derrota!'),
        content: const Text('10 es perder'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
          title: const Text('Selecciona un color'),
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
              child: const Text('Cerrar'),
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
          title: const Text('Selecciona un idioma:'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Español'),
                  onTap: () {
                    setState(() {
                      _idiomaActual = 'es';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Inglés'),
                  onTap: () {
                    setState(() {
                      _idiomaActual = 'en';
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _cambiarPagina() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Lista()));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Detalles2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_titulos[_idiomaActual]!),
      backgroundColor: _backgroundColor,
      actions: [
        IconButton(
          onPressed: _reiniciarContador,
          icon: const Icon(Icons.refresh),
        ),
        IconButton(
          onPressed: _mostrarSelectorColor,
          icon: const Icon(Icons.color_lens),
        ),
        IconButton(
          onPressed: _cambiarIdioma,
          icon: const Icon(Icons.language),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_clickContador',
            style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
          ),
          const Text(
            'Clicks',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: _decrementarContador,
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: _incrementarContador,
          child: const Icon(Icons.add),
        ),
        
        FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Lista()));
          },
          child: const Icon(Icons.next_plan),
        ),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Detalles2()));
          },
          child: const Icon(Icons.navigate_next_rounded),
        ),
   
      ],
    );
  }
}

void main() {
  runApp(const Contador());
}
