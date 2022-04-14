import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'dart:math' as math;

class TransactionList extends StatelessWidget {
  final List<Transactions> _userTransactions;
  TransactionList(this._userTransactions);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: _userTransactions.map((tx) {
      return Card(
          // color: Colors.orangeAccent,
          child: Row(
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  boxShadow: kElevationToShadow[4],
                  borderRadius: BorderRadius.circular(50)),
              padding: const EdgeInsets.all(10),
              child: Text(
                '\u{20B9} ' + tx.amount.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tx.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17),
              ),
              Text(
                DateFormat.yMMMMd().format(tx.dd),
                style: const TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ));
    }).toList());
  }
}
