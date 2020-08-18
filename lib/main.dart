import 'package:flutter/material.dart';
import 'package:my_expenses/widgets/new_transaction.dart';
import 'package:my_expenses/widgets/user_transactions.dart';
import './widgets/user_transactions.dart';

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
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenses"),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: UserTransactions(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
