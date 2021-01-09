import 'dart:math';

import 'package:app_expenses/grafico/grafico.dart';
import 'package:app_expenses/trancacao/componentes/transacoes-form.dart';
import 'package:app_expenses/trancacao/componentes/transacoes-list.dart';
import 'package:app_expenses/trancacao/transacao.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Transacao> transacoes = [
    /*Transacao(
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
    )*/
  ];

  @override
  void initState() {
    /// SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    /// SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  void mostrarModalNovaTransacao(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => TransacoesForm(novaTransacao: novaTransacao)
    );
  }

  void novaTransacao(final String titulo, final String valor) {
    if (titulo.isNotEmpty && valor.isNotEmpty) {
      final transacao = Transacao(
          uuid: Random().nextDouble().toString(),
          data: DateTime.now(),

          titutlo: titulo,
          valor: double.parse(valor)
      );

      setState(() => transacoes.add(transacao));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => mostrarModalNovaTransacao(context),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text('eXPenses'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Grafico(),
            TransacoesList(transacoesRealizadas: transacoes)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => mostrarModalNovaTransacao(context),
      ),
    );
  }

}
