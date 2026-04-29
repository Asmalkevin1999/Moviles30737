import '../models/producto.dart';

class SupermercadoController {
  double totalCliente = 0;
  double totalDia = 0;

  String? agregarProducto(String precioStr, String cantidadStr) {

    if (precioStr.isEmpty || cantidadStr.isEmpty) {
      return "Campos vacíos";
    }

    double? precio = double.tryParse(precioStr);
    int? cantidad = int.tryParse(cantidadStr);

    if (precio == null || cantidad == null) {
      return "Formato inválido";
    }

    if (precio <= 0 || cantidad <= 0) {
      return "Valores deben ser mayores a 0";
    }

    Producto p = Producto(precio: precio, cantidad: cantidad);
    totalCliente += p.subtotal;

    return null;
  }

  String? finalizarCliente() {
    if (totalCliente == 0) {
      return "No hay productos";
    }

    totalDia += totalCliente;
    totalCliente = 0;
    return null;
  }
}