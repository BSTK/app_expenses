import 'package:flutter/foundation.dart';

class Transacao {

  final String uuid;
  final String titutlo;
  final double valor;
  final DateTime data;

  const Transacao({
    @required this.uuid,
    @required this.data,
    @required this.valor,
    @required this.titutlo
  });

}
