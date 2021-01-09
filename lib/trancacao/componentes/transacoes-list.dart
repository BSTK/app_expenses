import 'package:app_expenses/helper/formatacao.dart';
import 'package:app_expenses/trancacao/transacao.dart';
import 'package:flutter/material.dart';

class TransacoesList extends StatelessWidget {

  final List<Transacao> transacoesRealizadas;

  const TransacoesList({
    @required this.transacoesRealizadas
  });

  Card itemTransacao(final Transacao transacao) {
    return Card(
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black38,
                        width: 2
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(50.0)
                    )
                ),
                child: Text(
                  'R\$ ${ transacao.valor.toStringAsFixed(2) }',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transacao.titutlo,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0
                  ),
                ),
                Text(
                    Formatacao.dataDDMMYYYYHHMMSS(transacao.data),
                    style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0
                    )
                )
              ],
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 120,
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: transacoesRealizadas.length,
        itemBuilder: (builderContext, index) {
          final transacao = transacoesRealizadas[index];
          return itemTransacao(transacao);
        },
      ),
    );
  }

}
