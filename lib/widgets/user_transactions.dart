import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_list.dart';
import './new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Shoes', ammount: 19.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'T-shirt', ammount: 34.51, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Sweatshirt', ammount: 73.22, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txPrice) {
    setState(() {
      transactions.add(Transaction(
        ammount: txPrice,
        title: txTitle,
        date: DateTime.now(),
        id: DateTime.now().toString(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //NewTransaction(_addTransaction),
          TransactionList(transactions),
        ],
      ),
    );
  }
}
