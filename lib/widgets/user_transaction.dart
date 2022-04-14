import 'package:expense_manager/models/transaction.dart';
import 'package:expense_manager/widgets/transactionList.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transactions> userTransaction = [
    Transactions(id: '1', title: 'Zomato', amount: 125, dd: DateTime.now()),
  ];

  void _addNewTransaction(String txtitle, double txamount) {
    final newtxt = Transactions(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        dd: DateTime.now());
    setState(() {
      userTransaction.add(newtxt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(userTransaction),
      ],
    );
  }
}
