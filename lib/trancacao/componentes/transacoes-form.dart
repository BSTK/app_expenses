import 'package:flutter/material.dart';

class TransacoesForm extends StatefulWidget {

  final Function(String, String) novaTransacao;

  TransacoesForm({
    @required this.novaTransacao,
  });

  @override
  _TransacoesFormState createState() => _TransacoesFormState();
}

class _TransacoesFormState extends State<TransacoesForm> {

  final valorController = TextEditingController();
  final tituloController = TextEditingController();

  void adicionarNovaTransacao() {
    if (tituloController.text.isEmpty
     || valorController.text.isEmpty) {
      return;
    }

    widget.novaTransacao(
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
