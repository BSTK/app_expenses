import 'dart:math';

import 'package:app_expenses/trancacao/componentes/transacoes-form.dart';
import 'package:app_expenses/trancacao/componentes/transacoes-list.dart';
import 'package:app_expenses/trancacao/transacao.dart';
import 'package:flutter/material.dart';

class Transacoes extends StatefulWidget {
  @override
  _TransacoesState createState() => _TransacoesState();
}

class _TransacoesState extends State<Transacoes> {

  final transacoes = [
    Transacao(
        uuid: DateTime.now().toIso8601String(),
        data: DateTime.now(),
        valor: 200.90,
        titutlo: 'Tênis de corrida'
    ),
    Transacao(
        uuid: DateTime.now().toIso8601String(),
        data: DateTime.now(),
        valor: 200.00,
        titutlo: 'Conta de luz'
    ),
    Transacao(
        uuid: DateTime.now().toIso8601String(),
        data: DateTime.now(),
        valor: 350.00,
        titutlo: 'Inalador T3'
    ),
    Transacao(
        uuid: DateTime.now().toIso8601String(),
        data: DateTime.now(),
        valor: 250.00,
        titutlo: 'Pneu 15 Michelan'
    )
  ];

  void criaNovaTransacao(final String titulo,
                         final String valor) {
    if (titulo.isNotEmpty && valor.isNotEmpty) {
      final novaTransacao = Transacao(
          uuid: Random().nextDouble().toString(),
          data: DateTime.now(),
          titutlo: titulo,
          valor: double.parse(valor)
      );

      setState(() => transacoes.add(novaTransacao));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransacoesForm(criaNovaTransacao: criaNovaTransacao),
        TransacoesList(transacoesRealizadas: transacoes),
      ],
    );
  }

}
