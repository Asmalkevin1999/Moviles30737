import 'package:flutter/material.dart';

import '../models/pedido_comida_modelo.dart';

class VistaNotaVentaComida
    extends StatelessWidget {

  const VistaNotaVentaComida({super.key});

  @override
  Widget build(BuildContext context) {

    final PedidoComidaModelo pedido =
    ModalRoute.of(context)!
        .settings
        .arguments as PedidoComidaModelo;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Nota de Venta"),
      ),

      body: Center(

        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Card(

              elevation: 10,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),

              child: Padding(
                padding: const EdgeInsets.all(25),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [


                    const Center(
                      child: Icon(
                        Icons.fastfood,
                        size: 80,
                        color: Colors.red,
                      ),
                    ),

                    const SizedBox(height: 10),


                    const Center(
                      child: Text(
                        "NOTA DE VENTA",

                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          letterSpacing: 1,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Center(
                      child: Text(
                        "Sistema de Comida Rápida",

                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Divider(
                      thickness: 1.5,
                    ),

                    const SizedBox(height: 10),


                    filaDetalle(
                      Icons.person,
                      "Cliente",
                      pedido.nombreCliente,
                    ),

                    filaDetalle(
                      Icons.fastfood,
                      "Producto",
                      pedido.producto,
                    ),

                    filaDetalle(
                      Icons.local_offer,
                      "Combo",
                      pedido.combo,
                    ),

                    filaDetalle(
                      Icons.numbers,
                      "Cantidad",
                      pedido.cantidad.toString(),
                    ),

                    const SizedBox(height: 20),

                    const Divider(
                      thickness: 1.5,
                    ),

                    const SizedBox(height: 15),


                    filaPrecio(
                      "Subtotal",
                      pedido.subtotal,
                    ),

                    const SizedBox(height: 10),

                    filaPrecio(
                      "IVA 15%",
                      pedido.iva,
                    ),

                    const SizedBox(height: 20),

                    Container(

                      width: double.infinity,

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: Colors.red.shade50,

                        borderRadius:
                        BorderRadius.circular(18),

                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),

                      child: Column(
                        children: [

                          const Text(
                            "TOTAL A PAGAR",

                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "\$${pedido.total.toStringAsFixed(2)}",

                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight:
                              FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),


                    const Center(
                      child: Text(
                        "¡Gracias por su compra!",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget filaDetalle(
      IconData icono,
      String titulo,
      String valor,
      ) {

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),

      child: Row(
        children: [

          Icon(
            icono,
            color: Colors.red,
          ),

          const SizedBox(width: 12),

          Text(
            "$titulo: ",

            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          Expanded(
            child: Text(
              valor,

              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget filaPrecio(
      String titulo,
      double valor,
      ) {

    return Row(

      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

      children: [

        Text(
          titulo,

          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        Text(
          "\$${valor.toStringAsFixed(2)}",

          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}