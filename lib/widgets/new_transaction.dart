// ignore_for_file: deprecated_member_us
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function txnew;

  NewTransaction(this.txnew);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime? _selectedDate;
  void submitData() {
    var enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }
    if (enteredAmount == 0) {
      enteredTitle += ' (Free) ';
    }

    widget.txnew(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _DatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (BuildContext context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.orangeAccent,
              onPrimary: Colors.deepOrange,
              surface: Colors.deepOrange.withOpacity(0.2),
              onSurface: Colors.orangeAccent,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date choosen'
                        : DateFormat.yMd().format(_selectedDate!),
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
                FlatButton(
                    onPressed: _DatePicker,
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
              onPressed: submitData,
              child: const Text(
                ' ₹ ',
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
