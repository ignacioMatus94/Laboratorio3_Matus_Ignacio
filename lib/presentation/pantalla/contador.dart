import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int _counter = 0;

  void _incrementarContador() {
    setState(() {
      _counter++;
      if (_counter == 10) {
        _mostrarResultado('Perdiste');
      } else if (_counter == 15) {
        _mostrarResultado('Ganaste');
      }
    });
  }

  void _decrementarContador() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _resetearContador() {
    setState(() {
      _counter = 0;
    });
  }

  void _mostrarResultado(String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(mensaje),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: _incrementarContador,
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: _decrementarContador,
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: _resetearContador,
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
