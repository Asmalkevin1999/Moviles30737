import 'package:flutter/material.dart';
import 'modelo/empleado.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pantalla(),
    );
  }
}

class Pantalla extends StatefulWidget {
  @override
  _PantallaState createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  TextEditingController edadCtrl = TextEditingController();
  TextEditingController antiguedadCtrl = TextEditingController();
  String resultado = "";

  Empleado emp = Empleado();

  void calcular() {
    int edad = int.tryParse(edadCtrl.text) ?? 0;
    int antiguedad = int.tryParse(antiguedadCtrl.text) ?? -1;

    if (edad <= 0) {
      setState(() {
        resultado = "Edad inválida";
      });
    } else if (antiguedad < 0) {
      setState(() {
        resultado = "Antigüedad inválida";
      });
    } else {
      int sueldo = emp.calcularSueldo(edad, antiguedad);
      setState(() {
        resultado = "Sueldo: $sueldo";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cálculo de Sueldo")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: edadCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Edad"),
            ),
            TextField(
              controller: antiguedadCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Antigüedad"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              child: Text("Calcular"),
            ),
            SizedBox(height: 20),
            Text(resultado),
          ],
        ),
      ),
    );
  }
}