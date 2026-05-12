import 'package:flutter/material.dart';

import '../controllers/comida_controlador.dart';
import '../widgets/molecules/formulario_pedido.dart';

class VistaComidaRapida extends StatefulWidget {
  const VistaComidaRapida({super.key});

  @override
  State<VistaComidaRapida> createState() =>
      _VistaComidaRapidaState();
}

class _VistaComidaRapidaState
    extends State<VistaComidaRapida> {

  final TextEditingController nombreController =
  TextEditingController();

  final TextEditingController cantidadController =
  TextEditingController();

  String productoSeleccionado = "hamburguesa";

  String comboSeleccionado =
      "solo producto (\$1.00)";

  final ComidaControlador controlador =
  ComidaControlador();

  void mostrarError(String mensaje) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.red,
      ),
    );
  }

  void generarNota() {

    String? error = controlador.validar(
      nombreCliente: nombreController.text,
      cantidadText: cantidadController.text,
    );

    if (error != null) {
      mostrarError(error);
      return;
    }

    String comboLimpio =
    comboSeleccionado.split(" (")[0];

    final pedido = controlador.procesar(
      nombreCliente: nombreController.text,
      producto: productoSeleccionado,
      combo: comboLimpio,
      cantidad: int.parse(
        cantidadController.text,
      ),
    );

    Navigator.pushNamed(
      context,
      '/notaVentaComida',
      arguments: pedido,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comida Rápida"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: FormularioPedido(
            nombreController: nombreController,
            cantidadController:
            cantidadController,

            productoSeleccionado:
            productoSeleccionado,

            comboSeleccionado:
            comboSeleccionado,

            onProductoChanged: (value) {
              setState(() {
                productoSeleccionado = value!;
              });
            },

            onComboChanged: (value) {
              setState(() {
                comboSeleccionado = value!;
              });
            },

            onPressed: generarNota,
          ),
        ),
      ),
    );
  }
}