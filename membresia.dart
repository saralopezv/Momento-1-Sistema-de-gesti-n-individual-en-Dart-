class Membresia {
  String documento;
  String nombre;
  String tipo;

  Membresia(this.documento, this.nombre, this.tipo);

  void mostrarInfo() {
    print('Doc: $documento - Nombre: $nombre - Tipo: $tipo');
  }
}
