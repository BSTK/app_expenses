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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('$dia',
                    style: TextStyle(fontSize: 20.0, fontFamily: 'Quicksand')),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.65,
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
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.10,
              child: FittedBox(
                child: Text('R\$ $valor',
                    style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Quicksand'
                    )),
              ),
            ),
          ],
        );
      }
    );
  }

}
