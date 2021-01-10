import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('$dia',
                style: TextStyle(fontSize: 20.0, fontFamily: 'Quicksand')),
          ),
          SizedBox(height: 3),
          Container(
            height: 60,
            width: 15,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                FractionallySizedBox(
                  heightFactor: percentual,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.cover,
            child: Text('R\$ $valor',
                style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: 'Quicksand'
                )),
          ),
        ],
      ),
    );
  }

}
