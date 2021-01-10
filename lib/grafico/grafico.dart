import 'package:app_expenses/grafico/grafico-barra.dart';
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

      return {
        'dia': Semana.dia(diaDaSemana.weekday)[0],
        'valor': totalSoma,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: transacoesAgrupadas.map((transacaoAgrupada) {
            return Flexible(
              fit: FlexFit.tight,
              child: GraficoBarra(
                dia: transacaoAgrupada['dia'],
                valor: transacaoAgrupada['valor'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

}
