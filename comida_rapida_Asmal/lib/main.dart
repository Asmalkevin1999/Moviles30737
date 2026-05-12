import 'package:flutter/material.dart';
import 'config/theme_app.dart';
import 'views/vista_comida_rapida.dart';
import 'views/vista_nota_venta_comida.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeApp.lightTheme,

      initialRoute: '/comida',

      routes: {
        '/comida': (context) => const VistaComidaRapida(),
        '/notaVentaComida': (context) =>
        const VistaNotaVentaComida(),
      },
    );
  }
}