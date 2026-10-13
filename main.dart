import 'dart:io';

void main() {
  print('SISTEMA DE GESTIÓN');
  print('-----------------------------');
  print('1. Registrar');
  print('2. Consultar todos');
  print('3. Buscar');
  print('4. Modificar');
  print('5. Eliminar');
  print('6. Mostrar resumen');
  print('0. Salir');
  print('-----------------------------');
  print('Seleccione una opción:');
  
  String? opcion = stdin.readLineSync();

  switch (opcion) {
    case '1':
      print('Eligió registrar');
      break;
    case '0':
      print('Saliendo...');
      break;
    default:
      print('Opción no válida');
  }
}
