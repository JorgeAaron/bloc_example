import 'dart:math';

class NombresRepository {

  final List<String> nombres = [
    "Jorge",
    "Manuel",
    "Lupita",
    "Sofia",
    "Julio",
    "Alberto",
    "Karla"

  ];

  Future<String> fraseAleatoria() async {
    var random = Random();
    return nombres[random.nextInt(nombres.length)];
  }

}