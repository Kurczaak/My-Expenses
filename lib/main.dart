import 'dart:developer';

import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Shoes', ammount: 19.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'T-shirt', ammount: 34.51, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Sweatshirt', ammount: 73.22, date: DateTime.now()),
  ];

  String titleInput;
  String ammountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenses"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Text("Chart"),
            color: Colors.blue,
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    onChanged: (value) => titleInput = value,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ammount',
                    ),
                    onChanged: (value) => ammountInput = value,
                  ),
                  FlatButton(
                    child: Text("Add Transaction"),
                    textColor: Colors.purple,
                    onPressed: () {
                      print(titleInput);
                      print(ammountInput);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ...transactions
                  .map((transaction) => TransactionWidget(transaction))
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}
