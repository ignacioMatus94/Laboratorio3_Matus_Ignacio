import 'package:flutter/material.dart';
import 'package:hola/presentation/pantalla/contador.dart';

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Ir a Contador'),
              onTap: () {
                _cambiarPagina(context, Contador());
              },
            ),
            ListTile(
              title: const Text('Ir a Detalle'),
              onTap: () {
                Navigator.of(context).pop(); // Cerrar la pantalla actual
              },
            ),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              _cambiarPagina(context, Contador());
            },
            child: Icon(Icons.next_plan),
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 72.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Lista()));
            },
            child: Icon(Icons.navigate_next_rounded),
          ),
        ),
      ],
    );
  }
}

void _cambiarPagina(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void main() {
  runApp(Lista());
}
