// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'Dunzo', amount: 81.00, dd: DateTime.now()),
    Transaction(id: '2', title: 'Swiggy', amount: 85.00, dd: DateTime.now()),
  ];

  String? inputTitle;
  String? inputAmount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: Text('Expense Manager', style: GoogleFonts.lato()),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 254, 83, 126),
                Color.fromARGB(255, 243, 135, 33)
              ], begin: Alignment.bottomRight, end: Alignment.topCenter)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 12,
              // color: Colors.orangeAccent,
              child: Text('chart!'),
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    onChanged: (val) {
                      inputTitle = val;
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    onChanged: (val) {
                      inputAmount = val;
                    },
                  ),
                  const FlatButton(
                    color: Colors.orangeAccent,
                    onPressed: null,
                    child: Text(
                      ' \u{20B9} ',
                      style: TextStyle(fontSize: 32),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
              children: transactions.map((tx) {
            return Card(
                // color: Colors.orangeAccent,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title as String,
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
          }).toList())
        ],
      ),
    );
  }
}
