import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transaction = [
    Transaction(id: '1', title: 'Dunzo', amount: 81.00, dd: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: const Text(
          'Expense Manager',
        ),
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
          Container(
            width: double.infinity,
            child: const Card(
              elevation: 12,
              color: Colors.orangeAccent,
              child: Text('chart!'),
            ),
          ),
          Column(
            children: const [
              Card(
                child: Text('hello'),
              )
            ],
          )
        ],
      ),
    );
  }
}
