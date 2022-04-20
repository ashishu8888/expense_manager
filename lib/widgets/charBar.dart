import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  const ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
            height: 20,
            child: FittedBox(
                child: Text('₹ ${spendingAmount.toStringAsFixed(0)}'))),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 60,
          width: 4,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            FractionallySizedBox(
              heightFactor: spendingPctOfTotal,
              //widthFactor: 0.2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orangeAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(label),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
