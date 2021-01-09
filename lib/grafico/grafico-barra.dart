import 'package:flutter/material.dart';

class GraficoBarra extends StatelessWidget {

  final String dia;
  final double valor;

  GraficoBarra({
    @required this.dia,
    @required this.valor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.green,
      width: 20.0,
      height: 50.0,
    );
  }
}
