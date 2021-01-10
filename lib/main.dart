import 'package:flutter/material.dart';

import 'home/homepage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eXPenses',
      debugShowCheckedModeBanner: false,
      color: Colors.redAccent,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: const TextStyle(
              fontWeight: FontWeight.w300,
              fontFamily: 'Quicksand',
              fontSize: 25.0
            )
          )
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: const TextStyle(
            fontWeight: FontWeight.w100,
            fontFamily: 'Quicksand'
          )
        )
      ),
      home: HomePage(),
    );
  }

}
