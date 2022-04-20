// ignore_for_file: deprecated_member_use

import 'package:expense_manager/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/transactionList.dart';
import 'models/transaction.dart';
import './widgets/chart.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Personal ',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String inputTitle;
  late String inputAmount;

  final List<Transactions> userTransaction = [
    //Transactions(id: '1', title: 'Zomato', amount: 125, dd: DateTime.now()),
  ];
  List<Transactions> get _recentTransaction {
    return userTransaction.where((tx) {
      return tx.dd.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txtitle, double txamount, DateTime choosenDate) {
    final newtxt = Transactions(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        dd: choosenDate);
    setState(() {
      userTransaction.add(newtxt);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: Text('Expense Manager', style: GoogleFonts.lato()),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: const Icon(Icons.add))
        ],
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
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity, child: Chart(_recentTransaction)),
              TransactionList(userTransaction, deleteTransaction)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
