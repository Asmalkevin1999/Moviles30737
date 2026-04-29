import 'package:flutter/material.dart';
import 'views/supermercado_page.dart';

void main() {
  runApp(SupermercadoApp());
}

class SupermercadoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicio 1 - Supermercado',
      home: SupermercadoPage(),
    );
  }
}