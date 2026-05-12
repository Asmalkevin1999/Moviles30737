import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../atoms/input_atom.dart';
import '../atoms/dropdown_atom.dart';
import '../atoms/button_atom.dart';

class FormularioPedido extends StatelessWidget {

  final TextEditingController nombreController;
  final TextEditingController cantidadController;

  final String productoSeleccionado;
  final String comboSeleccionado;

  final Function(String?) onProductoChanged;
  final Function(String?) onComboChanged;

  final VoidCallback onPressed;

  const FormularioPedido({
    super.key,
    required this.nombreController,
    required this.cantidadController,
    required this.productoSeleccionado,
    required this.comboSeleccionado,
    required this.onProductoChanged,
    required this.onComboChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 8,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Icon(
              Icons.fastfood,
              size: 70,
              color: Colors.red,
            ),

            const SizedBox(height: 10),

            const Text(
              "Pedido de Comida Rápida",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 25),

            //  SOLO LETRAS Y 20 CARACTERES
            InputAtom(
              controller: nombreController,
              label: "Nombre del cliente",

              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-ZáéíóúÁÉÍÓÚñÑ ]'),
                ),

                LengthLimitingTextInputFormatter(20),
              ],
            ),

            const SizedBox(height: 18),

            DropdownButtonFormField<String>(
              value: productoSeleccionado,

              decoration: const InputDecoration(
                labelText: "Producto",
                prefixIcon: Icon(
                  Icons.lunch_dining,
                  color: Colors.red,
                ),
              ),

              borderRadius: BorderRadius.circular(15),

              items: const [

                DropdownMenuItem(
                  value: "hamburguesa",
                  child: Text(
                    "Hamburguesa - \$3.50",
                  ),
                ),

                DropdownMenuItem(
                  value: "salchipapa",
                  child: Text(
                    "Salchipapa - \$2.75",
                  ),
                ),

                DropdownMenuItem(
                  value: "hot dog",
                  child: Text(
                    "Hot Dog - \$2.00",
                  ),
                ),
              ],

              onChanged: onProductoChanged,
            ),

            const SizedBox(height: 18),

            DropdownButtonFormField<String>(
              value: comboSeleccionado,

              decoration: const InputDecoration(
                labelText: "Tipo de combo",
                prefixIcon: Icon(
                  Icons.local_offer,
                  color: Colors.red,
                ),
              ),

              borderRadius: BorderRadius.circular(15),

              items: const [

                DropdownMenuItem(
                  value: "solo producto (\$1.00)",
                  child: Text(
                    "Solo producto - \$1.00",
                  ),
                ),

                DropdownMenuItem(
                  value: "combo con papas (\$1.50)",
                  child: Text(
                    "Combo con papas - \$1.50",
                  ),
                ),

                DropdownMenuItem(
                  value: "combo completo (\$3.00)",
                  child: Text(
                    "Combo completo - \$3.00",
                  ),
                ),
              ],

              onChanged: onComboChanged,
            ),

            const SizedBox(height: 18),

            //  SOLO 3 NÚMEROS
            InputAtom(
              controller: cantidadController,
              label: "Cantidad",

              keyboardType: TextInputType.number,

              inputFormatters: [

                FilteringTextInputFormatter.digitsOnly,

                LengthLimitingTextInputFormatter(3),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(

                onPressed: onPressed,

                icon: const Icon(Icons.receipt_long),

                label: const Text(
                  "Generar Nota de Venta",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}