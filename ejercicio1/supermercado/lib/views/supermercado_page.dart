import 'package:flutter/material.dart';
import '../controllers/supermercado_controller.dart';

class SupermercadoPage extends StatefulWidget {
  @override
  _SupermercadoPageState createState() => _SupermercadoPageState();
}

class _SupermercadoPageState extends State<SupermercadoPage> {

  final controller = SupermercadoController();
  final precioCtrl = TextEditingController();
  final cantidadCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void mostrar(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(" Supermercado"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [


                      TextFormField(
                        controller: precioCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Precio",
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese precio";
                          }
                          double? v = double.tryParse(value);
                          if (v == null) return "Número inválido";
                          if (v <= 0) return "Mayor a 0";
                          return null;
                        },
                      ),

                      SizedBox(height: 10),


                      TextFormField(
                        controller: cantidadCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Cantidad",
                          prefixIcon: Icon(Icons.numbers),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese cantidad";
                          }
                          int? v = int.tryParse(value);
                          if (v == null) return "Número inválido";
                          if (v <= 0) return "Mayor a 0";
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize: Size(double.infinity, 45),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                            String? error = controller.agregarProducto(
                                precioCtrl.text, cantidadCtrl.text);

                            if (error != null) {
                              mostrar(error);
                            } else {
                              setState(() {});
                              precioCtrl.clear();
                              cantidadCtrl.clear();
                            }
                          }
                        },
                        child: Text("Agregar Producto"),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              _totalCard("Total Cliente", controller.totalCliente, Colors.blue),
              _totalCard("Total Día", controller.totalDia, Colors.green),

              SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 45),
                ),
                onPressed: () {
                  String? error = controller.finalizarCliente();

                  if (error != null) {
                    mostrar(error);
                  } else {
                    setState(() {});
                  }
                },
                child: Text("Finalizar Cliente"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _totalCard(String titulo, double valor, Color color) {
    return Card(
      child: ListTile(
        title: Text(titulo),
        trailing: Text(
          "\$${valor.toStringAsFixed(2)}",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: color),
        ),
      ),
    );
  }
}