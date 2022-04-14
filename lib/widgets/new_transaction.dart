// ignore_for_file: deprecated_member_use
import './user_transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function txnew;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.txnew, {Key? key}) : super(key: key);
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
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
              color: Colors.orangeAccent,
              onPressed: () {
                txnew(
                    titleController.text, double.parse(amountController.text));
              },
              child: const Text(
                ' \u{20B9} ',
                style: TextStyle(fontSize: 32),
              ),
            )
          ],
        ),
      ),
    );
  }
}
