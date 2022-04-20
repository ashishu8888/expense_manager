import 'package:flutter/foundation.dart';

class Transactions {
  final String id;
  final String title;
  final double amount;
  final DateTime dd;

  Transactions(
      {required this.id,
      required this.title,
      required this.amount,
      required this.dd});
}
