import 'dart:io';
import 'membresia.dart';

void main() {
  List<Membresia> listaMembresias = [];
  Set<String> documentos = {};
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
        stdout.write('Ingrese documento: ');
        String doc = stdin.readLineSync() ?? '';
        stdout.write('Ingrese nombre: ');
        String nom = stdin.readLineSync() ?? '';
        if (nom.isEmpty) {
          print('El nombre no puede estar vacio');
          break;
        }
        stdout.write('Ingrese tipo (Mensual/Anual): ');
        String tipo = stdin.readLineSync() ?? '';
        
        if (documentos.contains(doc)) {
          print('Error: Ya existe una membresia con ese documento');
          break;
        }
        
        Membresia nueva = Membresia(doc, nom, tipo);
        listaMembresias.add(nueva);
        documentos.add(doc);
        print('Registrado correctamente.');
        break;
      case '2':
        print('\n--- Lista de Membresias ---');
        for (var mem in listaMembresias) {
          mem.mostrarInfo();
        }
        break;
      case '3':
        stdout.write('Ingrese documento a buscar: ');
        String? docBuscar = stdin.readLineSync();
        bool encontrado = false;
        
        for (var mem in listaMembresias) {
          if (mem.documento == docBuscar) {
            mem.mostrarInfo();
            encontrado = true;
            break;
          }
        }
        if (!encontrado) {
          print('No se encontró.');
        }
        break;
      case '4':
        stdout.write('Ingrese documento a modificar: ');
        String? docMod = stdin.readLineSync();
        for (var mem in listaMembresias) {
          if (mem.documento == docMod) {
            stdout.write('Nuevo nombre: ');
            mem.nombre = stdin.readLineSync()!;
            stdout.write('Nuevo tipo: ');
            mem.tipo = stdin.readLineSync()!;
            print('Modificado exitosamente.');
            break;
          }
        }
        break;
      case '5':
        stdout.write('Ingrese documento a eliminar: ');
        String? docEliminar = stdin.readLineSync();
        
        int index = -1;
        for (int i = 0; i < listaMembresias.length; i++) {
          if (listaMembresias[i].documento == docEliminar) {
            index = i;
            break;
          }
        }
        if (index != -1) {
          listaMembresias.removeAt(index);
          documentos.remove(docEliminar); // Arreglo: tambien quitarlo del set
          print('Eliminado correctamente.');
        } else {
          print('No se encontro a la persona.');
        }
        break;
      case '6':
        Map<String, int> resumen = {};
        for (var mem in listaMembresias) {
          if (resumen.containsKey(mem.tipo)) {
            resumen[mem.tipo] = resumen[mem.tipo]! + 1;
          } else {
            resumen[mem.tipo] = 1;
          }
        }
        print('\n--- Resumen ---');
        resumen.forEach((tipo, cantidad) {
          print('$tipo: $cantidad');
        });
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
