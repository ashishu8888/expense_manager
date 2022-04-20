import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'dart:math' as math;
import 'package:blurrycontainer/blurrycontainer.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> _userTransactions;
  TransactionList(this._userTransactions, this.txDelete);

  final Function txDelete;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 305,
          child: _userTransactions.isEmpty
              ? Column(
                  children: const [
                    Text(
                      'No Transactions added yet!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                        height: 100,
                        child: Image(
                            image: AssetImage('./lib/assets/images/fact.jpg')))
                  ],
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(
                                  (math.Random().nextDouble() * 0xFFFFFF)
                                      .toInt())
                              .withOpacity(0.6),
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              child: Text(
                                '\u{20B9} ' +
                                    _userTransactions[index]
                                        .amount
                                        .toStringAsFixed(2),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          _userTransactions[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 17),
                        ),
                        subtitle: Text(
                          DateFormat.yMMMMd()
                              .format(_userTransactions[index].dd),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            txDelete(_userTransactions[index].id);
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                  itemCount: _userTransactions.length,
                )),
    );
  }
}
