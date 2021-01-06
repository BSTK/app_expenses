import 'package:flutter/material.dart';

class TransacoesForm extends StatelessWidget {

  final valorController = TextEditingController();
  final tituloController = TextEditingController();

  final Function(String, String) criaNovaTransacao;

  TransacoesForm({
    @required this.criaNovaTransacao
  });

  @override
  Widget build(BuildContext context) {
    return             Container(
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
                          criaNovaTransacao(
                            tituloController.text,
                            valorController.text
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
    );
  }
}
