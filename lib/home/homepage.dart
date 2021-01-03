import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            /// TODO: REFATORAR PARA COMPONENTE: Gráfico
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Text('Gráfico'),
              ),
            ),

            /// TODO: REFATORAR PARA COMPONENTE: Transações
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Text('Transações'),
              ),
            )
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
