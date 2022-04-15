import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'dart:math' as math;

class TransactionList extends StatelessWidget {
  final List<Transactions> _userTransactions;
  TransactionList(this._userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 270,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
                child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(0.8),
                      boxShadow: kElevationToShadow[4],
                      borderRadius: BorderRadius.circular(50)),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\u{20B9} ' +
                        _userTransactions[index].amount.toStringAsFixed(2),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userTransactions[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                    Text(
                      DateFormat.yMMMMd().format(_userTransactions[index].dd),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ));
          },
          itemCount: _userTransactions.length,
        ));
  }
}
