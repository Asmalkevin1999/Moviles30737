class Empleado {
  int calcularSueldo(int edad, int antiguedad) {
    int suma = (antiguedad * (antiguedad + 1)) ~/ 2;
    return 35000 + edad + (100 * suma);
  }
}