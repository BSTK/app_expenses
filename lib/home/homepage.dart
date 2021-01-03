import 'package:app_expenses/trancacao/componentes/transacoes.dart';
import 'package:app_expenses/trancacao/transacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final valorController = TextEditingController();
  final tituloController = TextEditingController();

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text('eXPenses'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            /// TODO: REFATORAR PARA COMPONENTE: Gráfico
            Container(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Text('Gráfico'),
              ),
            ),
            /// TODO: REFATORAR PARA COMPONENTE: Transações

            Transacoes(transacoesRealizadas: transacoes),

            /// TODO: REFATORAR PARA COMPONENTE: Formulario de Transações
            Container(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: tituloController,
                        decoration: InputDecoration(
                          labelText: 'Titulo'
                        ),
                      ),
                      TextField(
                        controller: valorController,
                        decoration: InputDecoration(
                            labelText: 'Valor R\$'
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: () {
                              transacoes.add(
                                Transacao(
                                    uuid: DateTime.now().toIso8601String(),
                                    data: DateTime.now(),
                                    valor: double.parse(valorController.text),
                                    titutlo: tituloController.text
                                )
                              );
                            },
                            child: Text('Nova Transação', style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent
                            ))
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ),
            /// TODO: REFATORAR PARA COMPONENTE: Formulario de Transações


          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

}
