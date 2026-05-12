import '../models/pedido_comida_modelo.dart';

class ComidaControlador {

  final Map<String, double> preciosProducto = {
    "hamburguesa": 3.50,
    "salchipapa": 2.75,
    "hot dog": 2.00,
  };

  // ✔ COMBOS CORREGIDOS
  final Map<String, double> preciosCombo = {
    "solo producto": 1.00,
    "combo con papas": 1.50,
    "combo completo": 3.00,
  };

  String? validar({
    required String nombreCliente,
    required String cantidadText,
  }) {

    if (nombreCliente.trim().isEmpty) {
      return "El nombre del cliente es obligatorio";
    }

    // ✔ SOLO LETRAS
    final RegExp soloLetras =
    RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+$');

    if (!soloLetras.hasMatch(nombreCliente)) {
      return "El nombre solo debe contener letras";
    }

    if (cantidadText.trim().isEmpty) {
      return "La cantidad es obligatoria";
    }

    int cantidad = int.tryParse(cantidadText) ?? 0;

    if (cantidad <= 0) {
      return "La cantidad debe ser mayor a cero";
    }

    return null;
  }

  PedidoComidaModelo procesar({
    required String nombreCliente,
    required String producto,
    required String combo,
    required int cantidad,
  }) {

    double precioBase =
        preciosProducto[producto] ?? 0;

    double precioCombo =
        preciosCombo[combo] ?? 0;

    double subtotal =
        (precioBase + precioCombo) * cantidad;

    double iva = subtotal * 0.15;

    double total = subtotal + iva;

    return PedidoComidaModelo(
      nombreCliente: nombreCliente,
      producto: producto,
      combo: combo,
      cantidad: cantidad,
      subtotal: subtotal,
      iva: iva,
      total: total,
    );
  }
}