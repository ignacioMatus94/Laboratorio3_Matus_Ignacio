import 'package:flutter/material.dart';
import 'package:hola/presentation/pantalla/contador.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
     body: Center(
  child: Contador(),
),
      floatingActionButton: SizedBox(), 
    );
  }
}
