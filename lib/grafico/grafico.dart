import 'dart:math';

import 'package:app_expenses/grafico/semana.dart';
import 'package:app_expenses/trancacao/transacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Grafico extends StatelessWidget {

  final List<Transacao> transacoesRecentes;

  const Grafico({
    @required this.transacoesRecentes
  });

  List<Map<String, Object>> get transacoesAgrupadas {
    return List.generate(Semana.dias.length, (index) {
      final diaDaSemana = DateTime.now().subtract(
        Duration(days: index)
      );

      double totalSoma = 0.0;

      for (final transacao in transacoesRecentes) {
        final bool mesmoDia = transacao.data.day == diaDaSemana.day;
        final bool mesmoMes = transacao.data.month == diaDaSemana.month;
        final bool mesmoAno = transacao.data.year == diaDaSemana.year;

        if (mesmoDia && mesmoMes && mesmoAno) {
          totalSoma += transacao.valor;
        }
      }

      print('Dia = ${Semana.dia(index)[0]} | R\$ Valor = $totalSoma');

      return {
        'dia': Semana.dia(index)[0],
        'valor': totalSoma,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    transacoesAgrupadas;
    return Card(
      margin: const EdgeInsets.all(12.0),
      elevation: 10.0,
      child: Row(
        children: [
          Text('Gráfico')
        ],
      ),
    );
  }

}
