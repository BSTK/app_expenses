import 'package:flutter/material.dart';

class GraficoBarra extends StatelessWidget {

  final String dia;
  final double valor;
  final double percentual;

  GraficoBarra({
    @required this.dia,
    @required this.valor,
    @required this.percentual
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Text('$dia', style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Quicksand'
          )),
          Container(
            color: Colors.green,
            width: 20.0,
            height: 50.0,
          ),
          Text('R\$ $valor', style: TextStyle(
            fontSize: 13.0,
            fontFamily: 'Quicksand'
          )),
        ],
      ),
    );
  }

}
