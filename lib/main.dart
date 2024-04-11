import 'package:flutter/material.dart';
import 'package:hola/presentation/pantalla/contador.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true,colorSchemeSeed: Colors.blue),
      home: Contador(),
    );
  }
}
