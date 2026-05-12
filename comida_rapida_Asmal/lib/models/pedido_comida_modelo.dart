class PedidoComidaModelo {

  String nombreCliente;
  String producto;
  String combo;
  int cantidad;

  double subtotal;
  double iva;
  double total;

  PedidoComidaModelo({
    required this.nombreCliente,
    required this.producto,
    required this.combo,
    required this.cantidad,
    required this.subtotal,
    required this.iva,
    required this.total,
  });
}