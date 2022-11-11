class Articulo {
  ///ATRIBUTOS-----
  String nombre;
  int cantidad;
  double precio;
  double? total;

  ///CONSTRUCTORES-----
  Articulo(this.nombre, this.cantidad, this.precio) {
    total = cantidad * precio;
  }

}
