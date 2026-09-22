void main() {
  // Parte 1
    print("PARTE 1");
  String nombreEstudiante = "Juan Lozada";
  int edad = 24;
  double promedio = 3.5;
  bool estaMatriculado = true;
  String carrera = "Desarrollo de Software";

  print("Nombre: $nombreEstudiante");
  print("Edad: $edad anos");
  print("Promedio: $promedio");
  print("Matriculado: ${estaMatriculado ? 'Si' : 'No'}");
  print("Carrera: $carrera\n");

  /*
    COSITAS:
    si guardamos la edad como string, no se puede operar en comparaciones como edad >= 18, o edad+1 sin convertirla con `int.parse()`
hacerlo int lo hace mas csencillo
  */

  //Parte 2 Null 
  print("PARTE 2");
  String? apodo; 
  
  if (apodo != null) {
    print("Apodo: $apodo\n");
  } else {
    print("El estudiante no tiene apodo.\n");
  }

  /*
El apodo tiene que poderse nullear (String?) porque no es obligatorio que todo estudiante lo tenga.
pero el (nombre, edad) no son nullables porque son datos obligatorios.
si no se nullea y se deja vacio no deja compilar
  */

  //Parte 3:
  print("PARTE 3");
  print("Aprueba con nota 3.5?: ${aprueba(3.5)}");
  print("Aprueba con nota 2.8?: ${aprueba(2.8)}");

  List<double> misNotas = [4.0, 3.5, 2.8, 5.0];
  print("Promedio del semestre: ${promedioSemestre(misNotas)}\n");

  /*
 EL listado no puede estar vacio porque no se puede dividir por 0 entonces toca hacer un null serguro para que si compile si error como`if (notas.isEmpty) return 0.0;` antes.
  */


  //Parte 4
  print("=== PARTE 4: Colecciones ===");
  List<String> asistentes = ["Ana", "Luis", "Carlos", "Maria"];

  Set<String> lenguajes = {"Dart", "Python", "C++", "Java"};

  Map<String, double> notasPorNombre = {"Ana": 4.5, "Luis": 3.8, "Carlos": 2.5};

  print("Asistentes (List): $asistentes");
  print("Lenguajes (Set): $lenguajes");
  print("Notas por Nombre (Map): $notasPorNombre\n");

  /*
si usamos un set en ves de un list se pueden duplicar los nombres o las cosas y esto se evita para que no sea dmolesto.
  */


  //Parte 5
  print("PARTE 5");

  List<double> notasCurso = [1.5, 3.0, 4.8, 2.5, 5.0, 3.8];
  int reprobados = 0;
  int aprobados = 0;
  int sobresalientes = 0;

  for (double n in notasCurso) {
    if (n < 3.0) {
      reprobados++;
    } else if (n < 4.5) {
      aprobados++;
    } else {
      sobresalientes++;
    }
  }

  print("Reprobados (< 3.0): $reprobados");
  print("Aprobados (3.0 - 4.4): $aprobados");
  print("Sobresalientes (>= 4.5): $sobresalientes\n");

  //Validacion de acceso con while
  String claveCorrecta = "1234";
  int intentos = 0;
  bool bloqueado = false;

  print("Iniciando validacion de acceso...");
  while (intentos < 3 && !bloqueado) {
    String intento = "1234"; 
    intentos++;

    if (intento == claveCorrecta) {
      print("Acceso correcto intento $intentos.\n");
      break;
    }

    if (intentos == 3) {
      bloqueado = true;
      print("Acceso bloqueado por superar el limite de intentos.\n");
    }
  }

  //Parte 6

  print("PARTE 6");
  Estudiante e1 = Estudiante("Carlos", [4.0, 4.5]);
  Estudiante e2 = Estudiante("Maria", []);

  print(
    "Estudiante ${e1.nombre}:${e1.estaAlDia() ? 'Esta al dia' : 'Tiene notas pendientes'}",
  );
  print(
    "Estudiante ${e2.nombre}:${e2.estaAlDia() ? 'Esta al dia' : 'Tiene notas pendientes'}\n",
  );

  /*
    Modelar el objeto como una clase es mejor porque encapsula todos los datos
    si se elimina o inserta un registro en una sola lista, se desfasa todo el sistema.
  */


  //Reto:
  print("RETO: Gestion de Tareas");
  List<Tarea> tareas = [
    Tarea("Investigacion de Dart", "alta"),
    Tarea("Quiz 1: Variables y Funciones", "media"),
    Tarea("Quiz 2: Colecciones y POO", "media"),
    Tarea("Taller Practico de Moviles", "alta"),
    Tarea("Examen Parcial de Programacion", "alta"),
  ];

  // Marcar 1 tarea como completada
  tareas[0].completada = true;

  // Contar tareas pendientes
  int pendientes = 0;
  for (Tarea t in tareas) {
    if (!t.completada) {
      pendientes++;
    }
  }
  print("Tareas pendientes totales: $pendientes\n");

  // Mostrar listado
  print("--- Listado de Tareas ---");
  for (Tarea t in tareas) {
    print(
      "[Prioridad: ${t.prioridad.toUpperCase()}] ${t.titulo} ->${t.completada ? 'COMPLETADA' : 'PENDIENTE'}",
    );
  }

  int prioridadAlta = 0;
  int prioridadMedia = 0;
  int prioridadBaja = 0;

  for (Tarea t in tareas) {
    switch (t.prioridad.toLowerCase()) {
      case 'alta':
        prioridadAlta++;
        break;
      case 'media':
        prioridadMedia++;
        break;
      case 'baja':
        prioridadBaja++;
        break;
    }
  }

  print("\n--- Conteo por Nivel de Prioridad (Bonus) ---");
  print(
    "Alta: $prioridadAlta | Media: $prioridadMedia \vert{} Baja:$prioridadBaja",
  );

  
}


//FUNCIONES
// Funcion flecha para evaluar aprobacion
bool aprueba(double nota) => nota >= 3.0;
// Funcion para calcular promedio
double promedioSemestre(List<double> notas) {
  if (notas.isEmpty) {
    return 0.0;
  }
  double suma = 0.0;
  for (var nota in notas) {
    suma += nota;
  }
  return suma / notas.length;
}

// CLASES
class Estudiante {
  String nombre;
  List<double> notas;

  Estudiante(this.nombre, this.notas);

  bool estaAlDia() {
    return notas.isNotEmpty;
  }
}

class Tarea {
  String titulo;
  String prioridad;
  bool completada;

  Tarea(this.titulo, this.prioridad, [this.completada = false]);
}
