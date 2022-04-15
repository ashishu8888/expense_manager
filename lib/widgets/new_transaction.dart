// ignore_for_file: deprecated_member_use
import './user_transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function txnew;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  // ignore: use_key_in_widget_constructors
  NewTransaction(this.txnew);

  void submitData() {
    var enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }
    if (enteredAmount == 0) {
      enteredTitle += ' (Free) ';
    }

    txnew(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              color: Colors.orangeAccent,
              onPressed: submitData,
              child: const Text(
                ' \u{20B9} ',
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
