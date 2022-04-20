import 'dart:ffi';

import 'package:expense_manager/models/transaction.dart';
import 'package:expense_manager/widgets/charBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transactions> recentTransaction;
  Chart(this.recentTransaction);
  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDays = DateTime.now().subtract(Duration(days: index));
      // ignore: unused_local_variable
      double totalSum = 0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].dd.day == weekDays.day &&
            recentTransaction[i].dd.month == weekDays.month &&
            recentTransaction[i].dd.year == weekDays.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDays).substring(0, 3),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransaction.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransaction.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: data['day'].toString(),
                    spendingAmount: double.parse(data['amount'].toString()),
                    spendingPctOfTotal: totalSpending == 0
                        ? 0
                        : (data["amount"] as double) / totalSpending),
              );
            }).toList()),
      ),
    );
  }
}
