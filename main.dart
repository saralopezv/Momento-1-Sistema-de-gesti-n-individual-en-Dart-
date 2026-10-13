import 'dart:io';

class Membresia {
  String documento;
  String nombre;
  String tipo;

  Membresia(this.documento, this.nombre, this.tipo);

  void mostrarInfo() {
    print('Doc: $documento - Nombre: $nombre - Tipo: $tipo');
  }
}

void main() {
  bool continuar = true;
  
  while (continuar) {
    print('\nSISTEMA DE GESTIÓN');
    print('-----------------------------');
    print('1. Registrar');
    print('2. Consultar todos');
    print('3. Buscar');
    print('4. Modificar');
    print('5. Eliminar');
    print('6. Mostrar resumen');
    print('0. Salir');
    print('-----------------------------');
    stdout.write('Seleccione una opción: ');
    
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        print('Eligió registrar');
        break;
      case '0':
        print('Saliendo del programa...');
        continuar = false;
        break;
      default:
        print('Opción no válida');
    }
  }
}
