import 'package:flutter/material.dart';
import '../logica/logica.dart';

class Resultado extends StatefulWidget {
  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados', style: TextStyle(fontFamily: 'Roboto')),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Velocidad media: ${Logica.velocidadMedia.toStringAsFixed(2)} km/h',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
            ),
            Text(
              'Total litros gastados: ${Logica.totalLitrosGastados.toStringAsFixed(2)} litros',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
            ),
            Text(
              'Consumo de gasolina por km: ${Logica.consumoPorKilometro.toStringAsFixed(2)} litros',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
            ),
            Text(
              'Consumo de gasolina por 100 km: ${Logica.consumoPor100Km.toStringAsFixed(2)} litros',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
            ),
            Text(
              'Precio por km: ${Logica.precioPorKm.toStringAsFixed(2)} dolares',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresar a la pantalla inicial usando rutas
              },
              child: Text('Regresar', style: TextStyle(fontFamily: 'Roboto')),
            ),
          ],
        ),
      ),
    );
  }
}

