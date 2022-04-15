// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/user_transaction.dart';

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
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.add))],
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
            children: const [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 12,
                  // color: Colors.orangeAccent,
                  child: Text('chart!'),
                ),
              ),
              UserTransaction()
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: null,
        child: Icon(Icons.add),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 4,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: const [
      //       IconButton(
      //           onPressed: null,
      //           icon: Icon(
      //             Icons.home,
      //             color: Colors.orangeAccent,
      //           )),
      //       IconButton(
      //           onPressed: null,
      //           icon: Icon(
      //             Icons.settings,
      //             color: Colors.orangeAccent,
      //           ))
      //     ],
      //   ),
      // ),
    );
  }
}
