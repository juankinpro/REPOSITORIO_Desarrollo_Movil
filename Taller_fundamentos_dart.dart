void main() {
  String nombre = "Juan Lozada";
  int edad = 24;
  double promedio = 3.5;
  bool matriculado = true;

  print("Nombre: $nombre");
  print("Edad: $edad");
  print("Promedio: $promedio");
  print("Matriculado: $matriculado");

  String? apodo = null;

  if (apodo != null) {
    print("Apodo: $apodo");
  } else {
    print("Este estudiante no tiene apodo");
  }// apodo puede ser null porque no todos tienen, pero nombre y edad siempre existen

  print(aprueba(3.0));
  print(aprueba(2.0));

  List<double> notas = [4.0, 3.5, 2.8, 5.0];
  print("Promedio semestre: ${promedioSemestre(notas)}");

  List<String> asistentes = ["Ana", "Luis", "Ana"];
  Set<String> lenguajes = {"Dart", "Python", "C++"};
  Map<String, double> notasPorNombre = {"Ana": 4.5, "Luis": 3.8};

  print(asistentes);
  print(lenguajes);
  print(notasPorNombre);
}

bool aprueba(double nota) {
  return nota >= 3.0;
}

double promedioSemestre(List<double> notas) {
  double suma = 0;
  for (var nota in notas) {
    suma += nota;
  }
  return suma / notas.length;
}