import 'package:app_expenses/grafico/grafico.dart';
import 'package:app_expenses/trancacao/componentes/transacoes-list.dart';
import 'package:app_expenses/trancacao/componentes/transacoes-modal.dart';
import 'package:app_expenses/trancacao/transacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  void mostrarModalNovaTransacao(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => TransacoesModal(transacoes: transacoes)
    );
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
