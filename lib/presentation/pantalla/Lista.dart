import 'package:flutter/material.dart';
import 'package:hola/presentation/pantalla/contador.dart';
import 'contador.dart';
import 'Lista.dart';

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
              title: Text('Item 1'),
              onTap: () {
                _cambiarPagina(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                _cambiarPagina(context);
              },
            ),
          ],
        ),
        floatingActionButton: filaContador(context),
      ),
    );
  }

  Widget filaContador(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
       
        FloatingActionButton(
          onPressed: () {
            _cambiarPagina(context);
          },
          child: Icon(Icons.next_plan),
        ),
      ],
    );
  }
}

class Detalles extends StatelessWidget {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _cambiarPagina(context);
                },
                child: Icon(Icons.next_plan),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  _cambiarPagina(context);
                },
                child: Icon(Icons.navigate_next_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _cambiarPagina(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Lista()));
  Navigator.push(context, MaterialPageRoute(builder: (context) => Detalles()));
}

void main() {
  runApp(Lista());
}
