import 'package:flutter/material.dart';
import 'logica/logica.dart';
import 'interfaz/resultados.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Carretera',
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => MiAppState(), // Pantalla principal
        '/resultados': (context) => Resultado(), // Pantalla de resultados
      },
    );
  }
}

class MiAppState extends StatefulWidget {
  @override
  _MiAppState createState() => _MiAppState();
}

class _MiAppState extends State<MiAppState> {
  final TextEditingController controladorKm = TextEditingController();
  final TextEditingController controladorHoras = TextEditingController();
  final TextEditingController controladorMinutos = TextEditingController();
  final TextEditingController controladorDinero = TextEditingController();
  final TextEditingController controladorPrecioLitro = TextEditingController();

  String errorMessage = '';

  void procesar() {
    String km = controladorKm.text;
    String horas = controladorHoras.text;
    String minutos = controladorMinutos.text;
    String dinero = controladorDinero.text;
    String precioLitro = controladorPrecioLitro.text;

    // Validación de campos vacíos
    if (km.isEmpty || horas.isEmpty || minutos.isEmpty || dinero.isEmpty || precioLitro.isEmpty) {
      setState(() {
        errorMessage = 'Por favor, completa todos los campos.';
      });
      return;
    }

    // Validación de números
    if (double.tryParse(km) == null || double.tryParse(horas) == null ||
        double.tryParse(minutos) == null || double.tryParse(dinero) == null ||
        double.tryParse(precioLitro) == null) {
      setState(() {
        errorMessage = 'Por favor, ingresa valores numéricos válidos.';
      });
      return;
    }

    // Llamada a la lógica para calcular los resultados
    Logica().calcular(km, horas, minutos, dinero, precioLitro);

    // Navegar a la pantalla de resultados
    Navigator.pushNamed(context, '/resultados');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Carretera', style: TextStyle(fontFamily: 'Roboto')),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controladorKm,
              decoration: InputDecoration(hintText: 'Total de Km recorridos'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controladorHoras,
              decoration: InputDecoration(hintText: 'Tiempo tardado (Horas)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controladorMinutos,
              decoration: InputDecoration(hintText: 'Tiempo tardado (Minutos)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controladorDinero,
              decoration: InputDecoration(hintText: 'Dinero gastado en gasolina'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controladorPrecioLitro,
              decoration: InputDecoration(hintText: 'Precio por litro de gasolina'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red, fontFamily: 'Roboto'),
              ),
            ElevatedButton(
              onPressed: procesar,
              child: Text('Procesar', style: TextStyle(fontFamily: 'Roboto')),
            ),
          ],
        ),
      ),
    );
  }
}
