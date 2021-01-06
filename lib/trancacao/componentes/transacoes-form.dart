import 'package:flutter/material.dart';

class TransacoesForm extends StatelessWidget {

  final valorController = TextEditingController();
  final tituloController = TextEditingController();

  final Function(String, String) criaNovaTransacao;

  TransacoesForm({
    @required this.criaNovaTransacao
  });

  void adicionarNovaTransacao() {
    if (tituloController.text.isEmpty
     || valorController.text.isEmpty) {
      return;
    }

    criaNovaTransacao(
        tituloController.text,
        valorController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  onSubmitted: (_) => adicionarNovaTransacao(),
                  controller: tituloController,
                  decoration: InputDecoration(
                      labelText: 'Titulo'
                  ),
                ),
                TextField(
                  onSubmitted: (_) => adicionarNovaTransacao(),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: valorController,
                  decoration: InputDecoration(
                      labelText: 'Valor R\$'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        onPressed: () => adicionarNovaTransacao(),
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
    );
  }
}
