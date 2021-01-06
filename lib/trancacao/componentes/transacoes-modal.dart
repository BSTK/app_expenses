import 'dart:math';

import 'package:app_expenses/trancacao/componentes/transacoes-form.dart';
import 'package:app_expenses/trancacao/transacao.dart';
import 'package:flutter/material.dart';

class TransacoesModal extends StatefulWidget {

  final List<Transacao> transacoes;

  TransacoesModal({
    @required this.transacoes
  });

  @override
  _TransacoesModalState createState() => _TransacoesModalState();

}

class _TransacoesModalState extends State<TransacoesModal> {

  void criaNovaTransacao(final String titulo,
                         final String valor) {
    if (titulo.isNotEmpty && valor.isNotEmpty) {
      final transacao = Transacao(
          uuid: Random().nextDouble().toString(),
          data: DateTime.now(),
          titutlo: titulo,
          valor: double.parse(valor)
      );

      setState(() => widget.transacoes.add(transacao));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransacoesForm(criaNovaTransacao: criaNovaTransacao),
      ],
    );
  }

}
