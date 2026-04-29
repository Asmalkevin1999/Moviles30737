class Producto {
  double precio;
  int cantidad;

  Producto({required this.precio, required this.cantidad});

  double get subtotal => precio * cantidad;
}