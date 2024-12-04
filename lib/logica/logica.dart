class Logica {
  static double velocidadMedia = 0;
  static double totalLitrosGastados = 0;
  static double consumoPorKilometro = 0;
  static double consumoPor100Km = 0;
  static double precioPorKm = 0;

  void calcular(String km, String horas, String minutos, String dinero, String precioLitro) {
    double kmRecorridos = double.parse(km);
    double horasTardadas = double.parse(horas);
    double minutosTardados = double.parse(minutos);
    double dineroGastado = double.parse(dinero);
    double precioPorLitro = double.parse(precioLitro);

    // Calcular velocidad media
    velocidadMedia = kmRecorridos / (horasTardadas + minutosTardados / 60);

    // Calcular litros gastados
    totalLitrosGastados = dineroGastado / precioPorLitro;

    // Calcular consumo por km
    consumoPorKilometro = totalLitrosGastados / kmRecorridos;

    // Calcular consumo por 100 km
    consumoPor100Km = consumoPorKilometro * 100;

    // Calcular precio por km
    precioPorKm = dineroGastado / kmRecorridos;
  }
}
