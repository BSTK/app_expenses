import 'package:app_expenses/grafico/grafico-barra.dart';
import 'package:app_expenses/grafico/semana.dart';
import 'package:app_expenses/trancacao/transacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Grafico extends StatelessWidget {

  static const String TRANSACOES_AGRUPADAS_DIA = 'dia';
  static const String TRANSACOES_AGRUPADAS_VALOR = 'valor';

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
        TRANSACOES_AGRUPADAS_VALOR: totalSoma,
        TRANSACOES_AGRUPADAS_DIA: Semana.dia(diaDaSemana.weekday)[0],
      };
    });
  }

  double get totalSomaSemana {
    return transacoesAgrupadas.fold(0.0, (soma, transacao) {
      return soma + transacao[TRANSACOES_AGRUPADAS_VALOR];
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
            return GraficoBarra(
              dia: transacaoAgrupada[TRANSACOES_AGRUPADAS_DIA],
              valor: transacaoAgrupada[TRANSACOES_AGRUPADAS_VALOR],
              percentual: totalSomaSemana > 0
                ? (transacaoAgrupada[TRANSACOES_AGRUPADAS_VALOR] as double) / totalSomaSemana
                : 0.0,
            );
          }).toList(),
        ),
      ),
    );
  }

}
