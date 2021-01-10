import 'dart:io';

import 'package:app_expenses/helper/formatacao.dart';
import 'package:app_expenses/trancacao/transacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransacoesList extends StatelessWidget {

  final Function(int) excluirTransacao;
  final List<Transacao> transacoesRealizadas;

  const TransacoesList({
    @required this.excluirTransacao,
    @required this.transacoesRealizadas
  });

  Widget imagemNenhumaTransacao(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Não há transações cadastradas!',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 25.0),
          height: 350,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
            color: Colors.black38,
          ),
        )
      ],
    );
  }

  Widget transacoesCadastradas() {
    return ListView.builder(
      itemCount: transacoesRealizadas.length,
      itemBuilder: (builderContext, index) {
        final transacao = transacoesRealizadas[index];
        final bool orientacaoTelaLandscape = MediaQuery.of(builderContext).orientation == Orientation.landscape;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
            border: const Border(
              bottom: const BorderSide(
                color: Colors.black12,
              )
            )
          ),
          child: ListTile(
            leading: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black38,
                        width: 1
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(50.0)
                    )
                ),
                child: Text(
                  'R\$ ${ transacao.valor.toStringAsFixed(2) }',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            title: Text(
              transacao.titutlo,
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0
              ),
            ),
            subtitle: Text(
                Formatacao.dataDDMMYYYYHHMMSS(transacao.data),
                style: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0
                )
            ),
            trailing: orientacaoTelaLandscape
                ? FlatButton.icon(
                    onPressed: () => excluirTransacao(index),
                    icon: const Icon(Icons.delete),
                    label: Text('Excluir'),
                    textColor: Colors.redAccent,
                )
                : IconButton(
                  color: Colors.redAccent,
                  icon: const Icon(Icons.delete),
                  onPressed: () => excluirTransacao(index)
                )
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: transacoesRealizadas.isEmpty
        ? imagemNenhumaTransacao(context)
        : transacoesCadastradas(),
    );
  }

}
