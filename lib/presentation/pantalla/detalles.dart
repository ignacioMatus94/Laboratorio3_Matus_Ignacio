import 'package:flutter/material.dart';
import 'package:hola/presentation/pantalla/contador.dart';
import 'package:hola/presentation/pantalla/lista.dart';

class Detalles2 extends StatelessWidget {
  const Detalles2({Key? key}) : super(key: key);

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
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(context, 'Ir a Contador', () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Contador()));
              }),
              const SizedBox(height: 10),
              _buildButton(context, 'Ir a Lista', () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Lista()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        tileColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

void main() {
  runApp(const Detalles2());
}
